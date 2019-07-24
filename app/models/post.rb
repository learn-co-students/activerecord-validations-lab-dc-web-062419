class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
    validate :is_clickbait?
 

    WORDS = [
        /Won't Believe/,
        /Secret/,
        /Top [0-9]/,
        /Guess/
    ]


    def is_clickbait?
        if WORDS.none?  {|word| word.match title}
            errors.add(:title, "must be clickbaity")
        end
    end


end
