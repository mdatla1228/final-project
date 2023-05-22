# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord
  

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  belongs_to(:country, { :required => true, :class_name => "Country", :foreign_key => "country_id" })
  
end
