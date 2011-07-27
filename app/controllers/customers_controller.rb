class CustomersController < ApplicationController
  def index
      @customers = Customer.find(:all, :order => "first_name, last_name")
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

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = "Customer added."
      redirect_to customers_path
    else
      render('new') 
    end
  end
end
