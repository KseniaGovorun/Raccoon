# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  username           :string           default(""), not null
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :tweets
  has_many :likes
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
