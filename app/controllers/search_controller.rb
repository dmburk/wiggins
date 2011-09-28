class SearchController < ApplicationController
  #respond_to :js

  def search
    if params[:searchby] == "Customers"
      @results = Customer.find(:all, :conditions => { :first_name => params[:search] })
      redirect_to( :controller => "Customers", :action
    end
    if params[:searchby] == "Units"
      @results = Units.search(params[:search])
    end
  end

    

  #def self.search(q)
  #  [:name, :description].inject(scoped) do |combined_scope, attr|
  #    combined_scope.where("customers.#{attr} LIKE ?", "%#{q}%")
  #  end
  #end
end
