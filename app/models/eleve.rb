class Eleve < ApplicationRecord
  belongs_to :course

  before_save { self.mail = mail.downcase } # transforme les mails en lettres minuscules avant la sauvegarde

  validate :course , presence: true

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # empêche de s'inscrire avec le même mail
  has_secure_password # permet de hasher le password en le "cryptant" dans la base de données (le dev ne peut donc pas avoir connaissance celui-ci)
  validates :password, presence: true, length: { minimum: 6 }

end
