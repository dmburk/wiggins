class UnitsController < ApplicationController

  def index
    @units = Unit.search(params[:search])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(params[:unit])
    if @unit.save
      flash[:notice] = "Unit added."
    end
    redirect_to customer_path(@unit.customer_id)
  end
end
