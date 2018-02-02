class Course < ApplicationRecord

has_many :eleve , dependent: :destroy

validate :title , :description , :eleve , presence: true

end
