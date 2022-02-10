require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

    describe "GET #index" do
      it "renders the index template" do
        get :index, {}
        expect(response).to render_template("index")
      end
    end

    describe "GET #show" do
        it "renders the user" do
            get :show, {}
            ex
        end
    end
  
    # describe "POST #create" do
    #   context "with invalid params" do
    #     it "validates the presence of the user's email and password"
  
    #     it "validates that the password is at least 6 characters long"
    #   end
  
    #   context "with valid params" do
    #     it "redirects user to bands index on success"
    #   end
    # end
  end