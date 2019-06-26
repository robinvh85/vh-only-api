# frozen_string_literal: true

module Parameters
  class Category < Base
    def permitted_fields
      # Example: [:name, :age, { ids: [] }]
      [:name]
    end

    validates :name, presence: true
  end
end
