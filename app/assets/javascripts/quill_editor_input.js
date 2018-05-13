// Adapted from activeadmin/quill_editor_input.js
// https://github.com/blocknotes/activeadmin_quill_editor/blob/master/app/assets/javascripts/activeadmin/quill_editor_input.js

window.onload = function() {
  var editors = document.querySelectorAll('.quill-editor');
  var default_options = {
    // See https://quilljs.com/docs/formats/
    // Notably this disallows font and font color - copy-paste can bring that styling over and
    // result in final HTML that doesn't match the general page style.
    formats: [
      'align',
      'blockquote',
      'bold',
      'code',
      'code-block',
      'direction',
      'header',
      'image',
      'indent',
      'italic',
      'link',
      'list',
      'strike',
      'script',
      'underline',
      'video'
    ],
    modules: {
      clipboard: {
        matchVisual: false // https://quilljs.com/docs/modules/clipboard/#matchvisual
      },
      // https://quilljs.com/docs/modules/toolbar/
      toolbar: {
        container: [
          ['bold', 'italic', 'strike'],
          [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
          ['blockquote'],
          [{ 'list': 'ordered'}, { 'list': 'bullet' }],
          [{ 'script': 'sub'}, { 'script': 'super' }],
          [{ 'indent': '-1'}, { 'indent': '+1' }],
          [{ 'align': [] }],
          ['link', 'image', 'video']
        ],
        handlers: {
          'image': editor__imageHandler
        }
      }
    },
    theme: 'snow'
  };

  for( var i = 0; i < editors.length; i++ ) {
    var content = editors[i].querySelector('.quill-editor-content');
    if (content) {
      var options = editors[i].getAttribute('data-options') ? JSON.parse(editors[i].getAttribute('data-options')) : default_options;
      editors[i]['_quill-editor'] = new Quill(content, options);
    }
  }

  var formtastic = document.querySelector('form.formtastic');
  if (formtastic) {
    formtastic.onsubmit = function() {
      for( var i = 0; i < editors.length; i++ ) {
        var input = editors[i].querySelector( 'input[type="hidden"]' );
        input.value = editors[i]['_quill-editor'].root.innerHTML;
      }
    };
  }
};

function editor__imageHandler(value) {
  if (!value) return;

  let fileInput = this.container.querySelector('input.ql-image[type=file]');
  if (fileInput == null) {
    var quill = this.quill;
    fileInput = document.createElement('input');
    fileInput.setAttribute('type', 'file');
    fileInput.setAttribute('accept', 'image/png, image/gif, image/jpeg, image/bmp, image/x-icon');
    fileInput.classList.add('ql-image');
    fileInput.addEventListener('change', function() {
      if (fileInput.files != null && fileInput.files[0] != null) {
        editor__uploadImageAndPlaceInEditor(fileInput.files[0], quill);
      }
      fileInput.value = '';
    });
    this.container.appendChild(fileInput);
  }
  fileInput.click();
}

function editor__uploadImageAndPlaceInEditor(file, quill) {
  var range = quill.getSelection(true);
  var lastProgressUpdate = null;

  $.get('/admin/admin_users/get_presigned_url?filename=' + file.name, {}, function(uploadUrl) {
    $.ajax({
      type: 'PUT',
      url: uploadUrl,
      data: file,
      processData: false,
      contentType: false,
      // Custom XHR with upload progress handler added.
      xhr: function(){
        var xhr = $.ajaxSettings.xhr();
        xhr.upload.onprogress = function(event) {
          var progress = event.loaded / event.total * 100;
          if (lastProgressUpdate) {
            editor__deleteProgressUpdate(quill, range, lastProgressUpdate);
          }
          lastProgressUpdate = quill.insertText(range.index, 'Uploading, ' + parseInt(progress) + '%...');
        };
        return xhr;
      },
      error: function(xhr, textStatus, errorMsg) {
        console.log(errorMsg);
        alert('Failed to upload attachment: ' + textStatus + '. See the console for more detail.');
      },
      success: function(data, msg, xhr){
        // Strip off the signing token and other params to leave the plain URL.
        var finalUrl = uploadUrl.substring(0, uploadUrl.lastIndexOf('?'));
        if (lastProgressUpdate) {
          editor__deleteProgressUpdate(quill, range, lastProgressUpdate);
        }
        quill.insertEmbed(range.index, 'image', finalUrl);
      }
    });
  }, 'text');
}

function editor__deleteProgressUpdate(quill, range, lastProgressUpdate) {
  var insertOp;
  $.each(lastProgressUpdate['ops'], function(i, op) {
    if (op['insert']) {
      insertOp = op['insert'];
      return false;
    }
  });
  if (insertOp) {
    quill.deleteText(range.index, insertOp.length);
  }
}
