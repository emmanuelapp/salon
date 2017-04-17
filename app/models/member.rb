# The model Member holds the public profile data of staff members.
class Member < ApplicationRecord
  has_many :offers

  has_attached_file(
    :avatar,
    styles: { medium: '300x300>', thumb: '100x100>' },
    default_url: '/images/:style/missing.png'
  )

  has_many :reservations
  has_many :bookings, through: :reservations

  before_validation :generate_slug, on: :create

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

  validates_presence_of :first_name,
                        :last_name,
                        :profession,
                        :description

  validates :slug, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def generate_slug
    self.slug = SecureRandom.hex
  end
end
