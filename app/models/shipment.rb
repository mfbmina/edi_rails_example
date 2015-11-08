class Shipment < ActiveRecord::Base
  has_many :products

  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: proc { |attributes| attributes['description'].blank? }

  def update_from_xml(string)
    hash = Hash.from_xml(string)
    update_attribute(:storage_number, hash["storage"]["id"])
  end
end
