# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  body       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#  user_id    :integer
#
class City < ApplicationRecord

  belongs_to(:country, { :required => true, :class_name => "Country", :foreign_key => "country_id"})

  has_many(:must_see_sights, { :class_name => "MustSeeSight", :foreign_key => "city_id", :dependent => :destroy })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id"})
    



end
