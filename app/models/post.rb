
# class TitleValidator < ActiveModel::EachValidator
#     def validate_each(record, title, value)
#         unless value.match?(/\b(won't believe|secret|top.*[\d]|guess)\b/i)
#             record.errors[attribute] << (options[:message] || "is not clickbait")
#         end
#     end
# end


class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validate :post_has_to_be_click_bait
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Non-fiction Fiction)}

    def post_has_to_be_click_bait
        if !self.title.nil? && !self.title.match?(/\b(won't believe|secret|top.*[\d]|guess)\b/i)
             errors.add(:title, "has to be in clickbait")
         end
    end
end
