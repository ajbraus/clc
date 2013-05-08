class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :email

  validates :email, email: true

  attr_accessible :email, 
                :sex,
                :apparel, 
                :food, 
                :tech, 
                :medical, 
                :education, 
                :personal_care, 
                :recreation, 
                :car_travel, 
                :non_car_travel, 
                :rent,
                :home_ownership


end

