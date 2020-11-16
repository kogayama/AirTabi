class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
