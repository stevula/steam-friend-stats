class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, { limit: 64, null: false }
      t.text :body, { null: false }
      t.belongs_to :author, index: true

      t.timestamps(null: false)
    end
  end
end
