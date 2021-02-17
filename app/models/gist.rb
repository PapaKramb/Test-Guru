class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # def url
  #   "https://gist.github.com/#{url}"
  # end
  
end
