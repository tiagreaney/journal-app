# email:string 
# password_digest:string
#
# password:string virtual attribute
# password_confirmation: string virtual attribute

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

    has_many :entries
end
