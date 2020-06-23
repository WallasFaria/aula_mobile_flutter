class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    # if !current_user
    #   return head(401)
    # end
  end

  def current_user
    @current_user ||= Perfil.find_by uid: request.headers['token']
  end
end
