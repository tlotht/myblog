class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
