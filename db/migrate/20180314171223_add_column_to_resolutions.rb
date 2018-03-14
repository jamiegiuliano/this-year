class AddColumnToResolutions < ActiveRecord::Migration
  def change
    add_column :resolutions, :completed, :string
  end
end
