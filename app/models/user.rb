class User < ActiveRecord::Base

	has_secure_password

	validates :email, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true

	mount_uploader :w2, DocumentUploader
	mount_uploader :current1040, DocumentUploader
	mount_uploader :prior1040, DocumentUploader
end
