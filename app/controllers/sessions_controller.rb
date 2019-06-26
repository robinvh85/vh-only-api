# frozen_string_literal: true

class SessionsController < ApplicationDeviseController
  acts_as_token_authentication_handler_for UserDevise, only: [:destroy]

  def create
    user = UserDevise.find_by(email: params[:email])
    (json_response(user, :created) && return) if user&.valid_password?(params[:password])

    raise Errors::AuthorizationError, 'Credentials are not correct'
  end

  def destroy
    current_user_devise.reset_authentication_token!
    json_response({ message: 'Logout successfully' }, :ok)
  end
end
