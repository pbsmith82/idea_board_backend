class Idea < ApplicationRecord
    belongs_to :component
    has_many :comments

end
