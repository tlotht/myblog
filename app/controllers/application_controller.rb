class ApplicationController < ActionController::Base
  def per_page
    if params[:per_page].present?
      a = params[:per_page].to_i
    else
      a = 20
    end
    return a 
  end

  def page
    if params[:page].present?
      a = params[:page].to_i
    else
      a = 1
    end
    return [1,a].max 
  end
end
