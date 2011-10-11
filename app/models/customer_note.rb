class CustomerNote < ActiveRecord::Base
  before_filter :find_note, :only => [ :show, :edit, :update ]

  
end
