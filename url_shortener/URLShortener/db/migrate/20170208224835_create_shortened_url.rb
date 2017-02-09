class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
        t.string :short_url, uniqueness: true
        t.string :long_url, uniqueness: true
        t.integer :user_id

        t.timestamp
    end
  end
end
