class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :mail_type
      t.string :destination
      t.string :description
      t.string :depertment
      t.string :mail_number
      t.string :status
      t.datetime :sent_date
      t.datetime :received_date
      t.datetime :mail_room_date
      t.string :mail_room_status
      t.integer :mail_room_recipientid
      t.string :recipient_user_name
      t.integer :sender_id
      t.integer :recipient_id
      t.string :sender_name
      t.datetime :time_to_mailroom
      t.datetime :time_toreceived

      t.timestamps null: false
    end
  end
end
