class Adress < ApplicationRecord
  belongs_to :contact, optional:true
end
