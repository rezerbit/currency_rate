# frozen_string_literal: true

class AddForcedToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :forced, :boolean, null: false, default: false
  end
end
