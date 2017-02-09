# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tags = TagTopic.create!({tag: "search", url_id: 2})
tags = TagTopic.create!({tag: "videos", url_id: 1})
tags = TagTopic.create!({tag: "news", url_id: 1})
tags = TagTopic.create!({tag: "sports", url_id: 1})
tags = TagTopic.create!({tag: "fake news", url_id: 3})
tags = TagTopic.create!({tag: "search", url_id: 1})
