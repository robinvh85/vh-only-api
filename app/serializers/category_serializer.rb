# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unique_name

  def unique_name
    "#{object.id}_#{object.name}"
  end
end
