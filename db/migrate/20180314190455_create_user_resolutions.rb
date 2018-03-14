class CreateUserResolutions < ActiveRecord::Migration
  def change
    create_table :user_resolutions do |t|
      t.integer :user_id
      t.integer :resolution_id
    end
  end
end