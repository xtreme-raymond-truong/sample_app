# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible(:name, :email, :password, :password_confirmation)
  has_secure_password

  valid_email_regex = /\A[\w\d+\-.]+@[a-z\d\-.]+\.[a-z]{2,}+\z/i
  validates(:name, presence: true, length: { maximum: 50 })
  validates(:password, presence: true)
  #validates(:password_confirmation, presence: true)
  validates(
    :email, presence: true, format: { with: valid_email_regex },
    uniqueness: { case_sensitive: false }
  )
end
