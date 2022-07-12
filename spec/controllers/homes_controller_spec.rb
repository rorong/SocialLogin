require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  login_user

  let(:user) { create(:user) }

	before { sign_in user }

  describe 'user authentication' do
    it 'login user successfully' do
      expect(subject.current_user).not_to be_nil
    end

    context 'authenticate_social_login' do
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

  describe "GET #dashboard" do
    context 'assign user image' do
      before { get :dashboard }

      it 'assign user image successfully ' do
        expect(response.status).to eq(200)
      end
    end
  end
end
