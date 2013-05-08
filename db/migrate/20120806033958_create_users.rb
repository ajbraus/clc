class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :sex
      t.integer :apparel
      t.integer :food
      t.integer :tech
      t.integer :medical
      t.integer :education
      t.integer :personal_care
      t.integer :recreation
      t.integer :car_travel
      t.integer :non_car_travel
      t.integer :rent
      t.integer :home_ownership

      t.timestamps
    end
    add_index :users, :email
  end
end
