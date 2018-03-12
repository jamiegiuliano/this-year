class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
