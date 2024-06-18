class Contact < ApplicationRecord
   belongs_to :kind, optional:true
   has_many :phones, dependent: :destroy  
   has_one :adress, required: false, dependent: :destroy  
   has_one_attached :imagem

   accepts_nested_attributes_for :adress, allow_destroy: true
   accepts_nested_attributes_for :phones, allow_destroy: true

   validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
/
    #def birthdate_br
      I18n.l(self.birthdate) unless self.birthdate.blank?
    end
    def author
       "yam kevim"
    end

    def kind_description
      self.kind.description unless self.kind_id.blank?
    end
    
    def as_json(options={})
       x = super(options 
         #root:true,
         #methods: [:author, :birthdate_br],
         #except: :kind_id,
         #include: { kind: { only: [:id, :description]}}

       )
       x[:birthdate] = I18n.l(self.birthdate) unless self.birthdate.blank?
       x
    end 
/
end



