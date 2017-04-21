class CreateSubmitRequests < ActiveRecord::Migration
  def change
    create_table :submit_requests do |t|
      t.references :user, index: true, foreign_key: true, null: true
      t.references :task, index: true, foreign_key: true, null: true
      t.text :message
      t.integer :request_user_id, null: true
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
