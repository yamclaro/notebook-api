class ApplicationController < ActionController::API
      #include ActionController::HttpAuthentication::Basic::ControllerMethods
      #http_basic_authenticate_with name: "username", password: "passwd123"

       #include ActionController::HttpAuthentication::Token::ControllerMethods
       #before_action :authenticate
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
        begin
          JWT.decode token, 'my$ecretK3y', true, { algorithm: 'HS256' }
        rescue JWT::ExpiredSignature
        end
        
      end
end
