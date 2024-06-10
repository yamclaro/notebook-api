class Contact < ApplicationRecord
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def author
       "yam kevim"
    end
    
    def as_json(options={})
       super(methods: :author, root:true)
    end
end



