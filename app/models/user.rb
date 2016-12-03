class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  # http://edgeguides.rubyonrails.org/active_record_validations.html#acceptance
  # currently is not working, need to implement properly
  validates :terms_of_service, acceptance: { message: 'must be accepted' }
end
