# frozen_string_literal: true

class AddExpiresAtToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :expires_at, :datetime
  end
end
