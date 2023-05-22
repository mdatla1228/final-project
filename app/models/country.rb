# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  body       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  has_many(:cities, { :class_name => "City", :foreign_key => "country_id", :dependent => :destroy })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "country_id", :dependent => :destroy })

  has_many(:users, { :through => :bookmarks, :source => :user })

  has_many(:must_see_sights, { :through => :cities, :source => :must_see_sights })

end
