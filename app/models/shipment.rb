class Shipment < ActiveRecord::Base
  has_many :products

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['description'].blank? }
end
