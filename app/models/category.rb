class Category < ActiveRecord::Base
  validates :name, length: { maximum: 20 }, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :sidebar, length: { maximum: 5120 }
  validates :submission_text, length: { maximum: 1024 }

  has_many :posts

  default_scope { order('lower(name) ASC') }
  scope :added_today, -> { where('created_at > ?', Time.now.beginning_of_day) }
  # scope :added_today, lamda { where('created_at > ?', Time.now.beginning_of_day) }
  # def added_today
  #   where('created_at > ?', Time.now.beginning_of_day)
  # end

  # scope :redundant, -> (id) { where(id: id)}
  ## Is the same as
  # scope :redundant, lambda { |id| where(id: id) }
  ## Is the same as Proc, but will not raise an exception
  # scope :redundant, Proc.new { |id| where(id: id) }

  # def redundant(id)
  #   where(id: id)
  # end
end
