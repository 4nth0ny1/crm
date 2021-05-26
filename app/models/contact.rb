class Contact < ApplicationRecord
    belongs_to :account
    belongs_to :user
	has_many :opportunity_contacts
    has_many :account_contacts
    has_many :connections
    has_many :tasks
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, length: { maximum: 100 }
    validates :email, presence: true, {minimum: 8}
    


    def name 
        "#{first_name} #{last_name}"
    end 

 




end 