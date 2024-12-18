class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy # returns all the favorites records for the Book. For example if we Book.last.favorites, this will return all the favorites records.
  has_many :favorited_by_users, through: :favorites, source: :user
  validates :title, presence: true
  validates :description, presence: true
  validates :book_type, presence: true
  validates :author_country, presence: true
  validates :pages, presence: true,numericality: { only_integer: true, greater_than_or_equal_to:100,less_than_or_equal_to:1000}
  validate :title_length
  validate :description_length
  validate :author_country_check
  validate :book_type_check
  # validate :book_pages


  def title_length
    if title.length < 3
      errors.add(:title, 'Title book shold be more than 3 letters')
    end
  end

  def description_length
    if description.length > 200
      errors.add(:description, "description should not be less than 200 char")
    end
  end

  def author_country_check
    allwoed_country_list=["uk","iraq","us"]
    if allwoed_country_list.exclude?(author_country)
        errors.add(:author_country,'aouther country not ecpected')
    end
  end

  def book_type_check
    allowed_book_type=["drama","scince","action","learning","fun"]
    if allowed_book_type.exclude?(book_type.downcase)
      errors.add(:book_type, "book type not ecpected")
    end
  end

  def book_pages
    if pages < 100 || pages > 1000
      errors.add(:pages,'pages should be between 100 and 1000')
    end
  end

  def us_author?
    author_country == "us"
  end


  def book_author_type
    "#{author} #{book_type}"
  end

  def reader_age
    "#{book_type} is for age over 18"
  end

  def hours_ago
    hours_diff = ((Time.now - created_at) / 1.hour).to_i
    "#{hours_diff} hours ago"
  end

  def time_ago
    total_seconds = (Time.now - created_at).to_i
    hours = total_seconds / 3600
    minutes = (total_seconds % 3600) / 60
    seconds = total_seconds % 60

    "#{hours}h #{minutes}m #{seconds}s ago"
  end

end
