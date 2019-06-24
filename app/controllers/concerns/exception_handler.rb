# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Status code: https://gist.github.com/mlanett/a31c340b132ddefa9cca
    rescue_from StandardError do |e|
      json_response({ message: e.message }, :internal_server_error)
    end

    rescue_from Errors::ParameterError do |exception|
      json_response(
        {
          message: exception.message,
          errors: exception.error_messages
        }, :bad_reques
      )
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::RoutingError do |e|
      json_response({ message: "Not found URI '#{e.message}'" }, :not_found)
    end
  end
end
