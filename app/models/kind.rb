class Kind < ApplicationRecord
    belongs_to :contact, optional: true
end
