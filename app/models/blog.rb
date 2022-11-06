class Blog < ApplicationRecord
    validates :title, :body, presence: true
    validates :title, uniqueness: true

    belongs_to :user
    has_rich_text :body
end
