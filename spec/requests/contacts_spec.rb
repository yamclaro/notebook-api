# spec/requests/contacts_spec.rb
require 'swagger_helper'

describe 'Contacts API' do

  path '/contacts' do

    post 'Creates a contact' do
      tags 'Contacts'
      consumes 'application/json'
      parameter name: :contact, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          birthdate: { type: :string, format: 'date' } # assuming birthdate is a date string
          # Add other properties as per your Contact model
        },
        required: [ 'name', 'email' ]
      }

      response '201', 'contact created' do
        let(:contact) { { name: 'John Doe', email: 'john.doe@example.com', birthdate: '1990-01-01' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:contact) { { name: 'John Doe' } }
        run_test!
      end
    end

    get 'Retrieves a list of contacts' do
      tags 'Contacts'
      produces 'application/json'

      response '200', 'list of contacts' do
        run_test!
      end
    end
  end

  path '/contacts/{id}' do

    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a contact' do
      tags 'Contacts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'contact found' do
        let(:id) { Contact.create(name: 'Jane Doe', email: 'jane.doe@example.com').id }
        run_test!
      end

      response '404', 'contact not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a contact' do
      tags 'Contacts'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :contact, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          birthdate: { type: :string, format: 'date' } # assuming birthdate is a date string
          # Add other properties as per your Contact model
        }
      }

      response '200', 'contact updated' do
        let(:id) { Contact.create(name: 'Jane Doe', email: 'jane.doe@example.com').id }
        let(:contact) { { name: 'Updated Name' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Contact.create(name: 'Jane Doe', email: 'jane.doe@example.com').id }
        let(:contact) { { name: nil } }
        run_test!
      end

      response '404', 'contact not found' do
        let(:id) { 'invalid' }
        let(:contact) { { name: 'Updated Name' } }
        run_test!
      end
    end

    delete 'Deletes a contact' do
      tags 'Contacts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'contact deleted' do
        let(:id) { Contact.create(name: 'Jane Doe', email: 'jane.doe@example.com').id }
        run_test!
      end

      response '404', 'contact not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
