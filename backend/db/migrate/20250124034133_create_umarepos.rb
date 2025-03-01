class CreateUmarepos < ActiveRecord::Migration[7.0]
  def change
    create_table :umarepos do |t|
      t.string :title
      t.string :curator
      t.string :comment
      t.references :cook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
