# frozen_string_literal: true

module V1
  # CategoriesController
  class CategoriesController < ApplicationController
    include Swagger::Blocks
    include Swagger::CategoriesApi

    def index
      result = ::V1::Categories::GetService.new.perform

      json_response(result)
    end

    def create
      parameters = Parameters::Category.new(params)
      result = Categories::CreateService.new(parameters).perform

      json_response(result)
    end
  end
end
