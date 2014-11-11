class Post < ActiveRecord::Base
  validates_presence_of :title, :link
  validates :title, length: { maximum: 255 }
  enum post_type: [:link, :text]

end
