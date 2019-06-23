# frozen_string_literal: true

module Api
  module V1
    # CategoriesController
    class CategoriesController < ApplicationController
      include Swagger::Blocks
      include Swagger::CategoriesApi

      def index
        render json: Category.all
      end

      def create
        category = Category.create! name: params[:name], description: params[:description]

        render json: category
      end
    end
  end
end
