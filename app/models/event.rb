class Event < ActiveRecord::Base
  validate :validate_end_date
  validate :validate_registration_close_date

  validates :title, presence: true
  validates :event_type, presence: true
  validates :begin_date, presence: true
  validates :registration_cost, presence: true
  validates :registration_open_date, presence: true

  has_many :event_mappings, :dependent => :destroy
  has_many :users, :through => :event_mappings

  private
  
  def validate_end_date
  	errors.add(:end_date, "Cannot be blank") if end_date.blank?
  	errors.add(:end_date, "End date Cannot be in past") if end_date && (end_date < Time.zone.today)
  end

  def validate_registration_close_date
  	errors.add(:registration_close_date, "Cannot be blank") if registration_close_date.blank?
  	errors.add(:registration_close_date, "End date Cannot be in past") if registration_close_date && (registration_close_date < Time.zone.today)
  end
end
