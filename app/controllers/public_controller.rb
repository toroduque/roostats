class PublicController < ApplicationController

  layout 'public', :only => [:index]

  def index
    render(:layout => "layouts/public-index")
  end

  def about
  end

  def tips
  end

  def contact
  end
end
