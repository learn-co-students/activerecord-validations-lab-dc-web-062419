class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)} 
    validate :non_clickbait?


    PHRASE = [
        /Won't Believe/i,
        /Secret/i,
        /Top[number]/i,
        /Guess/i
    ]
    def non_clickbait?

        if PHRASE.none?{|phrase| phrase.match title}
          errors.add(:title, "not clicky enough")
        end
    end
end
