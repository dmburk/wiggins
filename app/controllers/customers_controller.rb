class CustomersController < ApplicationController
  before_filter :serial_search, :only => :index

  def index
    @customers = Customer.search(params[:search])
    #@customers = Customer.find(:all, :order => "first_name, last_name")
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
    @unit = Unit.new
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = "Customer updated."
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = "Customer added."
      redirect_to customers_path
    else
      render('new') 
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:notice] = "Customer deleted."
    redirect_to customers_path
  end

  def serial_search
    if params[:searchby] == "Serial Number"
      redirect_to :controller => 'units', :action => 'index', :search => params[:search]
    end
  end
end
