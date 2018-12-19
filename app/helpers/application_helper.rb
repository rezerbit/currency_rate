# frozen_string_literal: true

module ApplicationHelper
  def component(component_name, locals = {}, &block)
    name = component_name.split('_').first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  alias c component

  def alert_class_for(flash_type)
    {
      success: 'is-success',
      error: 'is-danger',
      alert: 'is-warning',
      notice: 'is-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
