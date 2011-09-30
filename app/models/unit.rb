class Unit < ActiveRecord::Base
  belongs_to :customer

  def self.search(search)
    if search
      find(:all, :conditions => ['serial_number LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
