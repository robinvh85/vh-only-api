# frozen_string_literal: true

# Swagger
module Swagger
  # Parameters
  class Parameters
    def self.extended(base)
      base.parameter :name do
        key :description, 'Name'
        key :type, :string
      end

      base.parameter :description do
        key :description, 'Description'
        key :type, :string
      end
    end
  end
end
