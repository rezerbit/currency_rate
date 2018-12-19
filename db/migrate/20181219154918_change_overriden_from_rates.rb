# frozen_string_literal: true

class ChangeOverridenFromRates < ActiveRecord::Migration[5.2]
  def change
    change_column :rates, :overridden, :boolean, null: false, default: false
  end
end
