class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :photo_url
      t.string :description

      t.timestamps
    end
  end
end
