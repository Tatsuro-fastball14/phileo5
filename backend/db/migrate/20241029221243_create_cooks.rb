class CreateCooks < ActiveRecord::Migration[7.0]
  def change
    create_table :cooks do |t|

      t.timestamps
    end
  end
end
