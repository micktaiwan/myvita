class Descr < ActiveRecord::Base
	belongs_to :step,  :counter_cache => true
  has_and_belongs_to_many :resumes
end
