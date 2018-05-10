class User < ApplicationRecord
  has_many :products, :foreign_key => :sellerId, :primary_key => :id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :first_name,:last_name, presence: true    

end
