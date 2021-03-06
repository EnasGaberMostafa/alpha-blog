class User < ActiveRecord::Base
    has_secure_password
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy # if user deleted delete his articles also
    validates :username, presence: true,
               uniqueness: {case_sensitive: false},
               length: {minimum: 3, maximum: 25}
    VAlID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
               uniqueness: {case_sensitive: false},
               length: {maximum: 105},
               format: { with: VAlID_EMAIL_REGEX }
end