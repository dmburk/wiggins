class UnitsController < ApplicationController

  def index
    @units = Unit.search(params[:search])
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(params[:unit])

    if @unit.save
      flash[:notice] = "Unit added."
    end
    redirect_to customer_path(@unit.customer_id)
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update_attributes!(params[:unit])
      flash[:notice] = "Unit updated"
      redirect_to customer_path(@unit.customer_id)
    else
      render 'edit'
    end
  end
end
