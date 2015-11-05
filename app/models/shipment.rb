class Shipment < ActiveRecord::Base
  has_many :products

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['description'].blank? }

  def update_from_xml(xml)
    # xml magic here
  end
end
