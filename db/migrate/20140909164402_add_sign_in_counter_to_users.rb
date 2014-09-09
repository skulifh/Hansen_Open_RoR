class AddSignInCounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sign_in_counter, :integer, default: 0 
  end
end
