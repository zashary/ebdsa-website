# frozen_string_literal: true

ActiveAdmin.register_page 'Setting' do
  title = 'Settings'
  menu label: title
  display = {
    homepage_hardcoded: :boolean,
    homepage_image_url: :string,
    search_in_footer: :boolean,

    banner_a_show: :boolean,
    banner_b_title: :string,
    banner_c_text: :string,
    banner_d_learn_more: :string,
  }
  active_admin_settings_page(title: title, display: display)
end
