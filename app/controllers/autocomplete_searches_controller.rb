class AutocompleteSearchesController < ApplicationController
  respond_to :js

  def index
    @customers = Customer.limit(10).search_for_name(params[:term])
    respond_with(@customers)
  end

  def self.search(q)
    [:name, :description].inject(scoped) do |combined_scope, attr|
      combined_scope.where("customers.#{attr} LIKE ?", "%#{q}%")
    end
  end
end
