# spec/requests/phones_spec.rb
require 'swagger_helper'

describe 'Phones API' do

  path '/phones' do

    post 'Creates a phone' do
      tags 'Phones'
      consumes 'application/json'
      parameter name: :phone, in: :body, schema: {
        type: :object,
        properties: {
          number: { type: :string },
          contact_id: { type: :integer }
          # Add other properties as per your Phone model
        },
        required: [ 'number', 'contact_id' ]
      }

      response '201', 'phone created' do
        let(:phone) { { number: '123456789', contact_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:phone) { { } }
        run_test!
      end
    end

    get 'Retrieves a list of phones' do
      tags 'Phones'
      produces 'application/json'

      response '200', 'list of phones' do
        run_test!
      end
    end
  end

  path '/phones/{id}' do

    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a phone' do
      tags 'Phones'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'phone found' do
        let(:id) { Phone.create(number: '987654321', contact_id: 1).id }
        run_test!
      end

      response '404', 'phone not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a phone' do
      tags 'Phones'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :phone, in: :body, schema: {
        type: :object,
        properties: {
          number: { type: :string },
          contact_id: { type: :integer }
          # Add other properties as per your Phone model
        }
      }

      response '200', 'phone updated' do
        let(:id) { Phone.create(number: '987654321', contact_id: 1).id }
        let(:phone) { { number: '999999999' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Phone.create(number: '987654321', contact_id: 1).id }
        let(:phone) { { number: nil } }
        run_test!
      end

      response '404', 'phone not found' do
        let(:id) { 'invalid' }
        let(:phone) { { number: '999999999' } }
        run_test!
      end
    end

    delete 'Deletes a phone' do
      tags 'Phones'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'phone deleted' do
        let(:id) { Phone.create(number: '987654321', contact_id: 1).id }
        run_test!
      end

      response '404', 'phone not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
