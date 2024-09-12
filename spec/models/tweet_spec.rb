require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'associations' do
    it { is_expected.to have_one { :tweets } }
    it { is_expected.to have_many { :comments } }
    it { is_expected.to have_many { :likes } }
  end
end
