class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :mail_type
      t.string :destination
      t.string :description
      t.string :mail_number
      t.string :status
      t.datetime :sent_date
      t.datetime :received_date
      t.datetime :mail_room_date
      t.string :mail_room_status
      t.string :recipient_user_name
      t.integer :sender_id
      t.string :sender_name

      t.timestamps null: false
    end
  end
end
