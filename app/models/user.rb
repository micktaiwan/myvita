require 'digest/sha1'

# this model expects a certain database
# layout and its based on the name/login pattern. 
class User < ActiveRecord::Base
   has_many :steps, :dependent => :destroy
   has_many :resumes, :dependent => :destroy
   #has_many :commenters, :through => :comments, :class_name => 'User', :select => 'distinct users.*'
   #has_and_belongs_to_many :projects

  def self.authenticate(login, pass)
    find_first(["login = ? AND pwd = ?", login, sha1(pass)])
  end  

  def change_pwd(pass)
    update_attribute "pwd", self.class.sha1(pass)
  end
    
  protected

  def self.sha1(pass)
    Digest::SHA1.hexdigest("laphrasedelamort#{pass}quitue")
  end
    
  before_create :crypt_pwd
  
  def crypt_pwd
    write_attribute("pwd", self.class.sha1(pwd))
  end

  validates_length_of :login, :within => 3..40
  validates_length_of :pwd, :within => 5..40
  validates_presence_of :login, :pwd, :pwd_confirmation
  validates_uniqueness_of :login, :on => :create
  validates_confirmation_of :pwd, :on => :create     
end
