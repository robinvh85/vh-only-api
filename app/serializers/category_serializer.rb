# frozen_string_literal: true

# CategorySerializer
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
