class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_enough?

  CLICKBAIT_STRINGS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait_enough?
    if CLICKBAIT_STRINGS.none? { |string| string.match title }
      errors.add(:title, "add more clickbait please")
    end
  end

end
