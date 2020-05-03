class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end
  end
end
