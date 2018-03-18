class CreateResolutions < ActiveRecord::Migration[4.2]
  def change
    create_table :resolutions do |t|
      t.string :name
    end
  end
end
