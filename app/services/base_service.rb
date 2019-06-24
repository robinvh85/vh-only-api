# frozen_string_literal: true

class BaseService
  def initialize(params = Parameters::Base.new)
    @params = params

    validate_params
  end

  private

  def validate_params
    raise Errors::ParameterError, @params.errors.messages unless @params.valid?
  end
end
