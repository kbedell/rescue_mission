class Question < ActiveRecord::Base
  has_many :answers, :dependent => :destroy

  validates :name, presence: true, length: {minimum: 40}
  validates :summary, presence: true, length: {minimum: 150}
  validates :asker, presence: true
end
