class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :accounts
    has_many :contacts 
    has_many :opportunities
    has_many :products

    scope :catullo, -> { where(last_name: "Catullo") }
    scope :by_first_name, -> { order(first_name: :desc) }

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.email = auth.info.email
          user.password = SecureRandom.hex
          user.google_token = auth.credentials.token
          user.google_refresh_token = auth.extra.id_token
        end
    end
end