class Package < ActiveRecord::Base
    belongs_to :sender, :class_name => 'User'
    belongs_to :recipient, :class_name => 'User'
    
    def self.search(search)
        if search
            where('mail_number LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
