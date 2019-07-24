class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
        message: "%{value} isn't one of our binary categories"}
    validate :clickbate  
    
    
    
    def clickbate
        if self.title
            if self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Guess") || self.title.include?("Top") 
                self.title
            else
                errors.add(:title, "Booooo not clickilicious enough")
            end
        end
    end
    
end
