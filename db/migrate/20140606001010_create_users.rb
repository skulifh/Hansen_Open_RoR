class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :fullname
      t.string :email
      t.string :remember_token
      t.boolean :admin

      t.timestamps
    end
  end
end
