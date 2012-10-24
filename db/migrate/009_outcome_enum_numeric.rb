class OutcomeEnumNumeric < ActiveRecord::Migration
  def self.up
    change_column :outcomes, :enum, :integer
  end

  def self.down
    change_column :outcomes, :enum, :string
  end
end
