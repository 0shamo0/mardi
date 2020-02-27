class Collaborator < ApplicationRecord
    has_many :tasks
    has_one_attached:image
end
