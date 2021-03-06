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

  describe "GET 'edit'" do
    it "should be successful" do
      @customer = Factory(:customer)
      get :edit, :id => @customer
      response.should be_success
    end
  end

  describe "PUT 'update'" do

    describe "failure" do
      before(:each) do
        @customer = Factory(:customer)
        @attr = { :first_name   => "", :last_name    => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @customer, :customer => @attr
        response.should render_template('edit')
      end
    end

    describe "success" do
      before(:each) do
        @customer = Factory(:customer)
        @attr = { :first_name => "Bob", :last_name  => "Thomas" }
      end

      it "should change the user's attributes" do
        put :update, :id => @customer, :customer => @attr
        @customer.reload
        @customer.first_name.should == @attr[:first_name]
        @customer.last_name.should  == @attr[:last_name]
      end

      it "should redirect to the customer show page" do
        put :update, :id => @customer, :customer => @attr
        response.should redirect_to(customer_path(@customer))
      end

      it "should have a flash message" do
        put :update, :id => @customer, :customer => @attr
        flash[:notice].should =~ /updated/
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @customer = Factory(:customer)
    end

    it "should destroy the customer" do
      lambda do
        delete :destroy, :id => @customer
      end.should change(Customer, :count).by(-1)
    end

    it "should redirect to the customers page" do
      delete :destroy, :id => @customer
      response.should redirect_to(customers_path)
    end
  end
end
