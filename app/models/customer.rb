class Customer < ActiveRecord::Base
  before_create :full_name
  has_many :units
  accepts_nested_attributes_for :units
  validates  :first_name, :last_name, :address, :city, :state, :zip, :contact, :presence => true
                         

  def full_name
    self.full_name = "#{first_name} #{last_name}"
  end
end
