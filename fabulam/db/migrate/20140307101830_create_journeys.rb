class CreateJourneys < ActiveRecord::Migration
  def change
    create_table:journeys do |t|
      t.integer :uid
	  t.string	:name

      t.timestamps
    end
	add_index :journeys,[:uid]
  end
end
