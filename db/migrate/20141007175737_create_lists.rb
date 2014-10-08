class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :playlist
      t.references :video

      t.timestamps
    end
  end
end
