class Source < ApplicationRecord
  #Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :clients, :categories

  validates :name, presence: true
  validates :url, presence: true
  
  belongs_to :user
end