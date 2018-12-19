# frozen_string_literal: true

class ChangeTypeFromRates < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE rate_types AS ENUM ('FetchedRate', 'ForcedRate');
      ALTER TABLE rates
        ALTER COLUMN type TYPE rate_types USING type::rate_types;
    SQL
  end

  def down
    change_column :rates, :type, :string # Previous type
    execute <<-SQL
      DROP TYPE rate_types;
    SQL
  end
end
