class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :final_bid
      t.text :preliminary_advice
      t.references :legal_request

      t.timestamps
    end
    add_index :bids, :legal_request_id
  end
end
