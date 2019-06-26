# frozen_string_literal: true

module V1
  module Categories
    class CreateService < BaseService
      def perform
        Category.create! name: @params.name, description: @params.description
      end
    end
  end
end
