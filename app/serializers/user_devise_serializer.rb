# frozen_string_literal: true

class UserDeviseSerializer < ActiveModel::Serializer
  attributes :email, :authentication_token
end
