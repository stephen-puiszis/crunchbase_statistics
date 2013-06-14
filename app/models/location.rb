class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :company_id, :countrycode, :latitude, :longitude, :statecode, :zipcode

  belongs_to :company

  geocoded_by :city
  # after_validation :geocode, if: :address_changed_and_no_longitude_and_latitude?

  def address_changed_and_no_longitude_and_latitude?
    city_changed? && self.latitude.blank? && self.longitude.blank?
  end

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
      obj.countrycode = geo.country_code
    end
  end

  # after_validation :reverse_geocode, if: :lat_and_long_changed_and_no_city?

  def lat_and_long_changed_and_no_city?
      latitude_changed? && self.zipcode.blank?
  end


end
