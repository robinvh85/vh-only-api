# frozen_string_literal: true

module Swagger
  module CategoriesApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/v1/categories' do
        operation :get do
          key :description, 'Get all category'
          key :operationId, :get_all
          key :tags, ['Categories']

          response 200 do
            key :description, 'All categories'
            schema do
              key :'$ref', :Category
            end
          end
        end
      end

      swagger_path '/v1/categories' do
        operation :post do
          key :description, 'Create new category'
          key :operationId, :new_category
          key :tags, ['Categories']

          parameter do
            key :name, :description
            key :description, 'Category name'
            key :type, :string
            key :required, true
          end

          parameter do
            key :name, :name
            key :description, 'Category description'
            key :type, :string
          end

          response 200 do
            key :description, 'A category has created'
            schema do
              key :'$ref', :Category
            end
          end
        end
      end
    end
  end
end
