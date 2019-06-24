# frozen_string_literal: true

module Swagger
  module CommonParameters
    def self.extended(base)
      ### Create common parameter
      base.parameter :name do
        key :description, 'Name'
        key :type, :string
      end

      # base.parameter :description do
      #   key :description, 'Description'
      #   key :type, :string
      # end
    end
  end
end
