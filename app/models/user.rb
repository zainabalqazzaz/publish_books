class User < ApplicationRecord
  has_many :books
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  
  validates :last_name, presence: true
  validate :validate_age

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def validate_age
    if age < 18
      errors.add(:dob, 'you should be older than 18 years')
    end
  end

  def age
    return 22 if dob.nil?
    
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  

end
