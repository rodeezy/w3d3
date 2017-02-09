# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :presence => true, :uniqueness => true

  def self.random_code
    result = SecureRandom.urlsafe_base64
    result = SecureRandom.urlsafe_base64 until !self.exists? result
    result
  end

  def self.shorten(user, url)
    self.create!(user_id: user.id, long_url: url, short_url: self.random_code)
  end

  belongs_to(
    :submitter,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: 'User'
  )

  has_many(
    :visits,
      primary_key: :id,
      foreign_key: :url_id,
      class_name: 'Visit'
  )

  has_many(
  :visitors,
  Proc.new { distinct },
  through: :visits,
  source: :visitor
)

  has_many(
  :tags,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: "TagTopic"
  )

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where('created_at <= ?',10.minutes.ago).count #.num_uniques
  end

end
