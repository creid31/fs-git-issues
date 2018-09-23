class Issue < ApplicationRecord
  validates_presence_of :url, :github_id, :number
end
