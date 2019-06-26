# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authenticate_request

  attr_reader :current_user

  def catch_404
    raise ActionController::RoutingError, params[:path]
  end

  private

  def authenticate_request
    command = AuthorizeApiRequest.call(request.headers)

    (@current_user = command.result) && return if command.success?

    error_key = command.errors.keys[0]
    raise Errors::AuthorizationError, Hash[error_key, command.errors[error_key].first]
  end
end
