require 'spec_helper'

describe CustomersController do

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "finds all customers" do
      # I'm not quite sure why this works.
      @customers = [Factory(:customer)]      
      get :index
      assigns[:customers].should == @customers
    end

    it "orders customers by first then last name" do
      # I can't get the test to work with .with(@params)
      # @params = ( :all, :order => "first_name, last_name" )
      Customer.should_receive(:find).with( :all, :order => "first_name, last_name" )
      get :index
    end
  end

  describe "GET new" do
    it "is successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST create" do

    describe "failure" do
      before(:each) do
        @attr = { :first_name => "",
                    :last_name  => "",
                    :address    => "",
                    :city       => "",
                    :state      => "",
                    :zip        => "",
                    :contact    => ""
        }
      end

      it "should not create a customer" do
        lambda do
          post :create, :customer => @attr
        end.should_not change(Customer, :count)
      end

      it "should render the 'new' page" do
        post :create, :customer => @attr
        response.should render_template('new')
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :first_name => "Bob",
                  :last_name  => "Thompson",
                  :address    => "123 Tool Blvd",
                  :city       => "Rocky Mount",
                  :state      => "NC",
                  :zip        => "27801",
                  :contact    => "252-555-5555"
        }
      end

      it "should create a new customer" do
        lambda do
          post :create, :customer => @attr
        end.should change(Customer, :count).by(1)
      end
      
      it "should redirect to the customer index" do
        post :create, :customer => @attr
        response.should redirect_to(customers_path)
      end
    end

  end
end
