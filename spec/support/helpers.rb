# frozen_string_literal: true

module Helpers
  def json_response
    obj = JSON.parse(response.body)
    case obj
    when Array
      obj.map(&:with_indifferent_access)
    else
      obj.with_indifferent_access
    end
  end
end
