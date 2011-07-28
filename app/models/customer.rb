class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address, :city, :state, :zip, :contact
  has_many :units
  before_create :full_name
  accepts_nested_attributes_for :units
  validates  :first_name, :last_name, :address, :city, :state, :zip, :contact, :presence => true
                         

  def full_name
    self.full_name = "#{first_name} #{last_name}"
  end
end
