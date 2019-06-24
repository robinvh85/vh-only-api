# frozen_string_literal: true

module V1
  module Categories
    class GetService < BaseService
      def perform
        Category.all
      end
    end
  end
end
