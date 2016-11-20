class User < ApplicationRecord
	has_secure_password
	has_many :likes
	has_many :ideas, dependent: :destroy
	has_many :ideas_liked, through: :likes, source: :idea
	email_regex= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :alias, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: email_regex}
	validates :password, presence: true, length: {minimum: 8}
end
