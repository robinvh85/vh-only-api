# frozen_string_literal: true

class UserDevise < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def reset_authentication_token!
    self.authentication_token = nil
    save! # automatically generates a new authentication token
  end
end
