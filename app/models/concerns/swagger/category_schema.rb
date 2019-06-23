# frozen_string_literal: true

module Swagger
  class CategorySchema
    extend ActiveSupport::Concern
    include Swagger::Blocks

    included do
      swagger_schema :Category do
        property :name do
          key :type, :string
        end

        property :description do
          key :type, :string
        end
      end
    end
  end
end
