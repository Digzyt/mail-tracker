class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def mailman?
    self.role == "Mailroom"
  end
  has_one :profile
  has_many :senders, :class_name => 'package', :foreign_key => 'sender_id'
  has_many :recipients, :class_name => 'package', :foreign_key => 'recipient_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
