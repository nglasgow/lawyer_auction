class CreateLegalRequests < ActiveRecord::Migration
  def change
    create_table :legal_requests do |t|
      t.string :legal_issue
      t.text :description

      t.timestamps
    end
  end
end
