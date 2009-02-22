class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks
  has_many                :tags, :as => :taggable
  
  class << self
    # -- We can use this to find or create any product.
    def find_or_create(params = {})
      found = self.find(:first, :conditions => params)
      return  found ? found : self.create!(params)
    end
    # --
  end
end
