# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :bigint           not null
#  origin_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validations' do
    it { is_expected.to validate_length_of(:body).is_at_most(300) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:origin) }
    it { is_expected.to have_many (:comments) }
    it { is_expected.to have_many (:likes) }
  end
end
