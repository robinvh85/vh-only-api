# frozen_string_literal: true

module V1
  class ApiDocsController < ApplicationController
    include Swagger::ApiDocs

    def index
      render json: docs_json, status: :ok
    end
  end
end
