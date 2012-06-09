class User < ActiveRecord::Base
  acts_as_authentic
  has_many :events, :through => :userevents
  has_many :userevents
  
  validates :fname, :presence =>true,:format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
validates :minitial, :presence =>true,:format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
validates :lname, :presence =>true,:format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }

validates :address, :presence =>true	
def fullname
		"#{fname} #{minitial} #{lname}"
	end

end