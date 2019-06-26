# frozen_string_literal: true

class Category < ApplicationRecord
  include Swagger::CategorySchema
end
