# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  long_url     :string           not null
#  short_url    :string           not null
#  submitter_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, uniqueness: true ,presence: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        if exists?(code)
            code = SecureRandom.urlsafe_base64
        end
        code
        # return SecureRandom.urlsafe_base64 unless short_url.exists?(SecureRandom.urlsafe_base64)

    end

    after_initialize do |user|
        return generate_short_url(user)
    end

    private
    def generate_short_url
        self.random_code
        
    end
    
end
