class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }        #ensure the title field is not empty
    validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :user_id, presence: true
    
end