class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :level
      t.integer :ex_point
      t.timestamps
    end
  end
end
