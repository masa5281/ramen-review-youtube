class ApplicationController < ActionController::Base
  # Deviseのコントローラー実行前に、configure_permitted_parametersメソッドを呼び出す。
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end