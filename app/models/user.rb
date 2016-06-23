class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone, :presence => true, :uniqueness => true
  validates_length_of :phone, :minimum => 10

  devise :database_authenticatable, :registerable

  has_many :event_mappings, :dependent => :destroy
  has_many :events, :through => :event_mappings
end
