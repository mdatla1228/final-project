class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :name
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
