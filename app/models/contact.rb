class Contact < ApplicationRecord
   belongs_to :kind 
   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def author
       "yam kevim"
    end

    def kind_description
      self.kind.description
    end
    
    def as_json(options={})
       super( 
         root:true,
         methods: [:author, :kind_description],
         except: :kind_id,
         include: { kind: { only: [:id, :description]}}
       )
    end
end



