class SignupsController < ApplicationController
  @state = nil

  before_action do
    unless ENV['NATION_SITE_SLUG']
      raise 'You must set NATION_SITE_SLUG in your .env to access this feature.'
    end
  end

  def index
    # nothing to show
  end

  def create
    person_input = {
      person: {
        email: params[:email],
      }
    }

    tags_input = params[:tags].split(',')

    # Show an error message if the user accidentally
    # submits a blank form
    if params[:email] == ''
      flash[:error] = 'Please enter an email address'
    else
      begin
        @person = nation_builder_client.call(:people, :push, person_input)
        person_id = @person['person']['id']
        nation_builder_client.call(:people, :tag_person, { id: person_id, tagging: {tag: tags_input }} )
        flash[:success] = 'Thank you for signing up.'
      rescue NationBuilder::ClientError => e
        flash[:error] = JSON.parse(e.message)['validation_errors'][0].capitalize
      end
    end
    redirect_back fallback_location: root_path
  end
end
