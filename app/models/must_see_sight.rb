# == Schema Information
#
# Table name: must_see_sights
#
#  id         :integer          not null, primary key
#  body       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  user_id    :integer
#
class MustSeeSight < ApplicationRecord
  belongs_to(:city, { :required => true, :class_name => "City", :foreign_key => "city_id", :counter_cache => true })

  has_one(:country, { :through => :city, :source => :country })
  
end
