class Event < ActiveRecord::Base
	has_many :users, :through => :userevents
    has_many :userevents

    validates :location_building, :uniqueness => true
end
