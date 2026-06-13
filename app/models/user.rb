class User < ApplicationRecord
  # Validate presence of all fields
  validates :name, :dob, :email, :phone_number, :address, presence: true

  # Validate email uniqueness at model level (case-insensitive)
  validates :email, uniqueness: { case_sensitive: false }

  # Validate email structure using standard URI mailto regex
  validates :email, format: { 
    with: URI::MailTo::EMAIL_REGEXP, 
    message: "must be a valid email address" 
  }
end
