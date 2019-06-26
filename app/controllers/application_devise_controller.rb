# frozen_string_literal: true

class ApplicationDeviseController < ActionController::API
  include Response
  include ExceptionHandler

  # acts_as_token_authentication_handler_for UserDevise, fallback_to_devise: false
  # acts_as_token_authentication_handler_for UserDevise, fallback: :exception
  # acts_as_token_authentication_handler_for UserDevise, fallback: :none
  acts_as_token_authentication_handler_for UserDevise

  def catch_404
    raise ActionController::RoutingError, params[:path]
  end

  private

  # When token authentication fails
  def authenticate_user_devise!
    raise Errors::AuthorizationError, 'Token authentication is not correct' unless current_user_devise
  end

  # Hook when token authentication is passed
  def after_successful_token_authentication
    # binding.pry
    # Make the authentication token to be disposable - for example
    # renew_authentication_token!
  end
end
