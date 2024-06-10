require 'swagger_helper'

RSpec.describe 'kinds', type: :request do

  path '/kinds' do

    get('list kinds') do
       tags 'Kinds'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create a kind') do
      tags 'Kinds'
      consumes 'application/json'
      parameter name: :kind, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string },
        },
        required: [ 'description']
      }

      response '201', 'kind created' do
        let(:kind) { { description: 'Corporativo'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:kind) { { description: 'Corporativo' } }
        run_test!
      end
    end
  end

  path '/kinds/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show kind') do
       tags 'Kinds'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update kind') do
       tags 'Kinds'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update kind') do
       tags 'Kinds'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete kind') do
       tags 'Kinds'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
