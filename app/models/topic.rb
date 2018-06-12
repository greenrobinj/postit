class Topic < ApplicationRecord
  belongs_to :board
  has_many :descriptions
  validates_presence_of :title, presence: true

end
