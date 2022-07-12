require 'rails_helper'

RSpec.describe User, type: :model do

  subject { create(:user) }

  describe '#valid?' do
    context 'when email is present' do
      before { subject.email = 'test@user.com' }

      it { is_expected.to be_valid }
    end

    context 'when email is not present' do
      before { subject.email = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when email is duplicated' do
      let(:user) { User.create }

      before { subject.email = user.email }

      it { is_expected.not_to be_valid }
    end

    describe 'authenticate_social_login' do
        let(:auth) do
          {
            :uid => '1341',
            :provider => 'facebook',
            :info => 
            {
              :name => 'John',
              :email => 'john@gmail.com'
            }
          }
        end

      subject{ User.authenticate_social_login(auth) }

      it 'authenticate user successfully' do
        expect(subject).to be_valid
      end

      it 'do not authenticate user successfully' do
        auth[:info][:email] = nil
        expect(subject).to be_nil
      end
    end
  end

  describe '#destroy' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'should destroy user' do
      expect { user.destroy }.to change(User, :count).by(-1)
    end
  end
end
