# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  url_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Visit < ActiveRecord::Base
  belongs_to(
    :visitor,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: "User"
  )

  belongs_to(
    :url,
      primary_key: :id,
      foreign_key: :url_id,
      class_name: "ShortenedUrl"
  )

  def self.record_visit!(user, shortened_url)
    self.create!(user_id: user.id, url_id: shortened_url.id)
  end


end
