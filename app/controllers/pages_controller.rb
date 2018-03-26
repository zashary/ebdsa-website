class PagesController < ApplicationController
  layout 'home', only: 'home'

  def home

    @home = Home.first
    raise 'Please create a homepage object first' unless @home

    @event = Event.query(Date.today, nil, 4).first
  end

  def show
    @page = Page.find_by_slug!(params[:slug])
  end

end
