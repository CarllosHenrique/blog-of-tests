class Person < ApplicationRecord
    belongs_to :admin, optional: true
end
