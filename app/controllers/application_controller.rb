# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def catch_404
    raise ActionController::RoutingError, params[:path]
  end
end
