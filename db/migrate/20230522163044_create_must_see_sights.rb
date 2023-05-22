class CreateMustSeeSights < ActiveRecord::Migration[6.0]
  def change
    create_table :must_see_sights do |t|
      t.integer :city_id
      t.integer :user_id
      t.string :body
      t.string :name

      t.timestamps
    end
  end
end
