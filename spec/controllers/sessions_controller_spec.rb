require 'rails_helper'
RSpec.describe SessionsController, :omniauth do
  login_user

  let(:user) { create(:user) }

  before do
    sign_in user
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET #create' do
    let(:omniauth_test) do
      {
        :uid => '1341',
        :provider => 'test',
        :info => 
        {
          :name => '',
          :email => ''
        }
      }
    end

    context 'user authentication' do
      it 'login user' do
        expect(subject.current_user).not_to be_nil
      end
    end

    context 'user sign up successfully' do
      it 'sign up through instagram' do
        expect {
          visit session_create_path(provider: 'instagram') 
        }.to change(User, :count).by(1)
      end

      it 'sign up through google' do
        expect {
          visit session_create_path(provider: 'google') 
        }.to change(User, :count).by(1)
      end

      it 'sign up through facebook' do
         expect {
           visit session_create_path(provider: 'facebook') 
         }.to change(User, :count).by(1)
      end

      it 'sign up through linkedin' do
        expect { 
          visit session_create_path(provider: 'linkedin') 
        }.to change(User, :count).by(1)
      end

      it 'return error' do
        post :create, provider: omniauth_test
        expect(response).to redirect_to(root_path) 
      end
    end
  end
end
