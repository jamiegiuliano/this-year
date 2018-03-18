class ChangeDateInEventsColumn < ActiveRecord::Migration[4.2]
  def change
    change_column :events, :date, :string
  end
end
