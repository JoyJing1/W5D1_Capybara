require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'POST #create' do





      context 'with invalid parameters' do
        context 'missing username' do
          before (:each) do
            post :create, user: {username: '', password: "password123"}
          end

          it 'validates the presence of username' do
            expect(flash[:errors]).to be_present
          end

          it 'redirects to the Create New User page' do
            expect(response).to render_template("new")
          end
        end

        context 'missing password' do
          before (:each) do
            post :create, user: {username: 'my_name', password: ""}
          end

          it 'validates the presence of password' do
            expect(flash[:errors]).to be_present
            expect(response).to render_template("new")
          end
        end

        context 'password is shorter than 6 characters' do
          it 'does redirects to the Create New User page' do
            post :create, user: { username: 'my_name', password: "short" }
            expect(flash[:errors]).to be_present
            expect(response).to render_template("new")
          end

        end

      end

    end


end
