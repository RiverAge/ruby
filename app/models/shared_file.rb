class SharedFile < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, presence: true
  validates :category, presence: true
  validates :path, presence: true

end
