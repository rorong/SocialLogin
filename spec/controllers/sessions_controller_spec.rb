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
      context 'instagram authentication' do
        let(:create_session) { visit session_create_path(provider: 'instagram') }

        it 'sign up through instagram' do
          expect{ create_session }.to change(User, :count).by(1)
        end

        it 'sign up successfully' do
          create_session
          expect(response.status).to eq(200)
        end
      end

      context 'facebook authentication' do
        let(:create_session) { visit session_create_path(provider: 'facebook') }

        it 'sign up through facebook' do
          expect{ create_session }.to change(User, :count).by(1)
        end

        it 'sign up successfully' do
          create_session
          expect(response.status).to eq(200)
        end
      end

      context 'linkedin authentication' do
        let(:create_session) { visit session_create_path(provider: 'linkedin') }

        it 'sign up through linkedin' do
          expect{ create_session }.to change(User, :count).by(1)
        end

        it 'sign up successfully' do
          create_session
          expect(response.status).to eq(200)
        end
      end

      context 'google authentication' do
        let(:create_session) { visit session_create_path(provider: 'google') }

        it 'sign up through google' do
          expect{ create_session }.to change(User, :count).by(1)
        end

        it 'sign up successfully' do
          create_session
          expect(response.status).to eq(200)
        end
      end

      it 'return error' do
        post :create, provider: omniauth_test
        expect(response).to redirect_to(root_path) 
      end
    end
  end
end
