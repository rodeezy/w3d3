# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  tag        :string           not null
#  url_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base

  belongs_to(
  :url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: "ShortenedUrl"
  )

  def popular_links
    url.all.order(:visits).limit(5)
  end

end
