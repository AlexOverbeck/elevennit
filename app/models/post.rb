class Post < ActiveRecord::Base
  validates :title, length: { maximum: 255 }, presence: true
  validates :link, length: { maximum: 2000 }, presence: true, if: :link?
  validates :body, presence: true, if: :text?
  enum post_type: [:link, :text]

  belongs_to :category

  default_scope { order("updated_at DESC") }
  scope :with_category, -> { includes(:category) }
  scope :added_today, -> { where('created_at > ?', Time.now.beginning_of_day)}
end
