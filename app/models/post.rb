class Post < ActiveRecord::Base
  validates :title, length: { maximum: 255 }, presence: true
  validates :link, length: { maximum: 2000 }, presence: true, if: :link?
  validates :body, presence: true, if: :test?
  enum post_type: [:link, :text]

end
