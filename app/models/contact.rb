class Contact < ApplicationRecord
   belongs_to :kind, optional:true
   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def birthdate_br
      I18n.l(self.birthdate) unless self.birthdate.blank?
    end
    def author
       "yam kevim"
    end

    def kind_description
      self.kind.description unless self.kind_id.blank?
    end
    
    def as_json(options={})
       super( 
         root:true,
         methods: [:author, :birthdate_br],
         #except: :kind_id,
         #include: { kind: { only: [:id, :description]}}
       )
    end
end



