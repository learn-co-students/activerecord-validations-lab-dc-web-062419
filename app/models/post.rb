class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :click_baity?

    CLICKS = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

    def click_baity?
        if CLICKS.none?  {|word| word.match title}
            errors.add(:title, "CLICK HOLE!")
        end
    end
end
