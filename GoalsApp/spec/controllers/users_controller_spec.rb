require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'POST #create' do
      context 'with valid parameters' do
        before(:each) do
          # let!(:user) { User.create({username: "my_name", password: "password123"})}
          post :create, user: {username: 'my_name', password: "password123"}
        end

        it 'logs user in' do
          expect(current_user.username).to eq("my_name")
        end

        it 'redirects to user\'s show page' do
          expect(response).to redirect_to(user_url(user))
        end

        it 'sets session_token' do #potentially remove?
          expect(current_user.session_token).to not_be(nil)
        end

      end

      context 'with invalid parameters' do
        context 'missing username' do

          it 'validates the presence of username'

          it 'redirects to the Create New User page'

          it 'does not persist the password'
        end

        context 'missing password' do
          it 'validates the presence of password'

          it 'persists username'

          it 'does not save user to database'
        end

        context 'password is shorter than 6 characters' do
          it 'does redirects to the Create New User page'

        end

      end

    end


end
