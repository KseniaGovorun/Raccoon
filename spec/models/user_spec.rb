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
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username) }
  end

  context 'associations' do
    it { should have_many (:tweets) }
    it { should have_many (:comments) }
    it { should have_many (:likes) }
  end
end