class PublicController < ApplicationController

  layout 'public', :only => [:index]

  def index
  end

  def about
    render(:layout => "layouts/application")
  end

  def tips
    render(:layout => "layouts/application")
  end

  def contact
    render(:layout => "layouts/application")
  end
end
