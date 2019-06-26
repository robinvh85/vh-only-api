# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    json_response(auth_token: command.result) && return if command.success?

    error_key = command.errors.keys[0]
    raise Errors::AuthorizationError, Hash[error_key, command.errors[error_key].first]
  end
end
