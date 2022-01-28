class ShortenUrl < ApplicationRecord
    validates :short_url, long_url, presence: true, uniqueness: true
    validates :user_id, presence: true
end
