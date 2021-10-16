module V1
  module Helpers
    module AuthenticationHelper
      def authenticate_user!
        error!({ error: "Invalid token" }, :unauthorized) if current_user.nil?
      end

      def current_user
        @current_user ||= AuthorizeApiRequest.call(headers).result
      end
    end
  end
end
