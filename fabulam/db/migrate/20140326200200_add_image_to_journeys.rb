class AddImageToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :image, :string
  end
end
