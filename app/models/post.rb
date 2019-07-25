class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 200}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_validate
   
    def title_validate
    
            if !self.title.nil?  && !["Won't Believe", "Secret", "Top [number]", "Guess"]
                errors.add(:title, "This is not clickbait")
            end

            # if self.title != nil && !(['']include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess"))
            #     errors.add(:title, "This is not clickbait")
            # end
    end



    


end


# class MyValidator < ActiveModel::Validator
    

# end