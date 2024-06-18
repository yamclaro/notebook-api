# spec/requests/kinds_spec.rb
require 'swagger_helper'

describe 'Kinds API' do

  path '/kinds' do

    post 'Creates a kind' do
      tags 'Kinds'
      consumes 'application/json'
      parameter name: :kind, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string }
          # Add other properties as per your Kind model
        },
        required: [ 'description' ]
      }

      response '201', 'kind created' do
        let(:kind) { { description: 'Personal' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:kind) { { } }
        run_test!
      end
    end

    get 'Retrieves a list of kinds' do
      tags 'Kinds'
      produces 'application/json'

      response '200', 'list of kinds' do
        run_test!
      end
    end
  end

  path '/kinds/{id}' do

    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a kind' do
      tags 'Kinds'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'kind found' do
        let(:id) { Kind.create(description: 'Work').id }
        run_test!
      end

      response '404', 'kind not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a kind' do
      tags 'Kinds'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :kind, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string }
          # Add other properties as per your Kind model
        }
      }

      response '200', 'kind updated' do
        let(:id) { Kind.create(description: 'Personal').id }
        let(:kind) { { description: 'Updated Kind' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Kind.create(description: 'Personal').id }
        let(:kind) { { description: nil } }
        run_test!
      end

      response '404', 'kind not found' do
        let(:id) { 'invalid' }
        let(:kind) { { description: 'Updated Kind' } }
        run_test!
      end
    end

    delete 'Deletes a kind' do
      tags 'Kinds'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'kind deleted' do
        let(:id) { Kind.create(description: 'Personal').id }
        run_test!
      end

      response '404', 'kind not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
