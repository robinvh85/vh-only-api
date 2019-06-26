# frozen_string_literal: true

module Parameters
  class Base
    include ActiveModel::Validations

    LIMIT_DEFAULT = 100

    def initialize(params = ActionController::Parameters.new)
      # params = default_options.merge(correct_options(params))
      @params = permit_params(params)

      permitted_fields.each do |field|
        if field.is_a?(Hash)
          field.keys.each do |key|
            self.class.send(:attr_accessor, key)
            instance_variable_set("@#{key}".to_sym, @params[key])
          end
        else
          self.class.send(:attr_accessor, field)
          instance_variable_set("@#{field}".to_sym, @params[field])
        end
      end
    end

    def permitted_fields
      []
    end

    private

    def permit_params(params)
      params.permit(permitted_fields)
    end

    def default_options
      {
        # offset: 0,
        # limit: LIMIT_DEFAULT
      }
    end
  end
end
