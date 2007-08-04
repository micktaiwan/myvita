class Step < ActiveRecord::Base
   belongs_to :user
   has_many :descrs, :dependent => :destroy 
   #has_many :commenters, :through => :comments, :class_name => 'User', :select => 'distinct users.*'
   #has_and_belongs_to_many :projects

  #validates_length_of :login, :within => 3..40
  #validates_length_of :pwd, :within => 5..40
  #validates_presence_of :login, :pwd, :pwd_confirmation
  #validates_uniqueness_of :login, :on => :create
  #validates_confirmation_of :pwd, :on => :create     
end
