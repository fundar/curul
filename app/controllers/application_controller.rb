class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :scope_current_site
  
#  check_authorization :unless => :devise_controller?
  
  def current_site
    @current_site ||= Site.find_by_host domain
  end  
  helper_method :current_site
  
  def scope_current_site
    Site.current_id = current_site.try(:id)
    self.class.layout 'custom' if current_site.try(:custom_layout?) 
  end
  
  def domain
    request.domain
  end
  
  def subdomain
    request.subdomain
  end
end
