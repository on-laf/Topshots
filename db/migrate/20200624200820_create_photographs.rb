class CreatePhotographs < ActiveRecord::Migration[6.0]
  def change
    create_table :photographs do |t|
      t.references :photographer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
