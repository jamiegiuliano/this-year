class CreateResolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :resolutions do |t|
      t.string :name
    end
  end
end
