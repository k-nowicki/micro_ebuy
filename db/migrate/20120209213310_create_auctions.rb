class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name,       :null => false
      t.datetime :end_at,   :null => false
      t.string :type,       :null => false

      t.timestamps
    end
  end
end
