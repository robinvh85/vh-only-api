# frozen_string_literal: true

module V2
  class CategoriesController < ApplicationDeviseController
    include Swagger::Blocks
    include Swagger::CategoriesApi

    def index
      result = ::V1::Categories::GetService.new.perform

      # binding.pry
      json_response(result)
    end
  end
end
