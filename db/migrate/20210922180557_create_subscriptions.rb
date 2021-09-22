class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :status
      t.integer :frequency
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
