class ServiceNotesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @service_note = ServiceNote.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @service_note = ServiceNote.new(params[:service_note])
    
    if @service_note.save
      flash[:notice] = "Service detail added."
    end
    redirect_to customer_path(@service_note.customer_id)
  end

  def edit
    @service_note = ServiceNote.find(params[:id])
    @customer = Customer.find(params[:customer_id])
  end

  def update
    @service_note = ServiceNote.find(params[:id])
    if @service_note.update_attributes(params[:service_note])
      flash[:notice] = "Service note updated."
      redirect_to customer_path(@service_note.customer_id)
    else
      render 'edit'
    end
  end
end
