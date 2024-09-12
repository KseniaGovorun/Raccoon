require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:username) }
  end

  context 'associations' do
    it { is_expected.to have_many { :tweets } }
    it { is_expected.to have_many { :comments } }
    it { is_expected.to have_many { :likes } }
  end
end
