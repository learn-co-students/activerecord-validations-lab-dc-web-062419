# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 50 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction], message: '%{value} is not a valid category' }
  validate :clickbait?

  def clickbait?
    click_bait = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

    if click_bait.none? { |pattern| pattern.match title }
      errors.add :title, 'must be clickbait'
    end
  end
end
