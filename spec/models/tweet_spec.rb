# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :bigint           not null
#  origin_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validations' do
    it { should validate_length_of(:body).is_at_most(300) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:origin) }                      # it { should have_one (:origin).with_foreign_key('origin_id') }
    it { should have_many (:comments) }
    it { should have_many (:likes) }
  end
end
