class CreateGalleriesTournamentsJoin < ActiveRecord::Migration
  def change
    create_table :galleries_tournaments do |t|
    	t.integer :gallery_id
    	t.integer :tournament_id
    end
  end
end
