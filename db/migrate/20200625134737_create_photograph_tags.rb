class CreatePhotographTags < ActiveRecord::Migration[6.0]
  def change
    create_table :photograph_tags do |t|
      t.references :photograph, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
