# spec/swagger_helper.rb
require 'rswag/api'
require 'rswag/ui'

# Configura o diretório raiz onde os arquivos Swagger serão gerados
Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'
end

# Configura o endpoint Swagger UI
Rswag::Ui.configure do |c|
  c.swagger_endpoint '/api-docs/v1/swagger.json', 'API V1 Docs'
end

# Configura os esquemas de segurança para token JWT
Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'
  c.security_scheme 'Authorization' do
    key :type, :apiKey
    key :name, :Authorization
    key :in, :header
  end
end
