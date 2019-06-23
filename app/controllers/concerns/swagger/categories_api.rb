# frozen_string_literal: true

module Swagger
  class CategoriesApi
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_path '/api/v1/categories' do
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

      swagger_path '/api/v1/categories' do
        operation :post do
          key :description, 'Create new category'
          key :operationId, :new_category
          key :tags, ['Categories']

          parameter :name
          parameter :description

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
