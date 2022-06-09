class Sub < ApplicationRecord
has_many :topics, dependent: :destroy

  vaildates :title, presence: true 
  vaildates :title, uniqueness: true
end
