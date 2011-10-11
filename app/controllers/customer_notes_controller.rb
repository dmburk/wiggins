class CustomerNotesController < ApplicationController
  before_filter :find_note, :only => [ :show, :edit, :update, :destroy ]

  
  def new
    @customer_note = CustomerNote.new
  end

  def create
    @customer_note = CustomerNote.new(params[:customer_note])
    if @customer_note.save
      flash[:notice] = "Customer note added."
      redirect_to customer
    else
      render('new')
    end
  end

  def edit
  end

  def update
    if @customer_note.update_attributes(params[:customer_note])
      flash[:notice] = "Customer note updated."
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer_note.destroy
    flash[:notice] = "Customer note deleted."
    redirect_to customers_path
  end

  def find_note
    @customer_note = CustomerNote.find(params[:id])
  end
end
