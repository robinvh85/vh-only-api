# frozen_string_literal: true

module Swagger
  class ApiDocs
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'VH API'
          key :description, 'Documents for VH API'
        end
        key :basePath, '/'
        key :consumes, ['application/json']
        key :produces, ['application/json']

        extend Swagger::Parameters
      end

      SWAGGERED_CLASSES = [
        Category,
        Api::V1::CategoriesController,
        self
      ].freeze
    end

    def docs_json
      Swagger::Blocks.build_root_json SWAGGERED_CLASSES
    end
  end
end
