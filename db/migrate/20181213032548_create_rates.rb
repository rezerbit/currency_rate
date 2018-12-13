# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.decimal :value, precision: 8, scale: 4, null: false
      t.timestamp :created_at, null: false, unique: true
    end
  end
end
