# frozen_string_literal: true

module Response
  extend ActiveSupport::Concern

  included do
    # Response status on rails: https://gist.github.com/mlanett/a31c340b132ddefa9cca
    def json_response(object, status = :ok)
      render json: object, status: status
    end
  end
end
