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
end
