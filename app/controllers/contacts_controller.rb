class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all
    render json: @contacts, include: :adress
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [:phones, :kind, :adress]

  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact,include: [:phones, kind: { only: [:id, :description]}],
                   status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:phones, :kind, :adress]

    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(
      :name, :email, :birthdate, :kind_id, :imagem,
      phones_attributes: [:id, :number, :_destroy],
      adress_attributes: [:id, :street, :city]
    )
  end
end