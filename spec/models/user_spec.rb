# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  fullname               :string
#  username               :string
#  image                  :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  it 'is valid with required attributes' do
    expect(user).to be_valid
  end

  it 'is not valid with invalid email' do
    user.email = ''
    expect(user).to be_invalid
  end

  context 'is not valid with already registered email' do
    let(:user2) { create :user}
    let(:new_user) { build :user, email: user2.email} 

    it 'should return invalid email' do
      expect(new_user).to be_invalid
    end  
  end

  it 'is not valid with blank fullname' do
    user.fullname = ''
    expect(user).not_to be_valid
  end

  context 'is not valid with already taken username' do 
    let(:new_user) {create :user}
    let(:new_user2) { build :user, email: new_user.username}  

    it 'should return invalid username' do 
      expect(new_user2).not_to be_valid
    end  
  end
end
