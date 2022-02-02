# frozen_string_literal: true

require 'web_token'

module Devise
  module Strategies
    class JWTAuthenticatable < Base
      def authenticate!
        return raise(:invalid) if token.blank?

        payload = WebToken.decode(token)
        return raise(:invalid) if payload == :expired

        resource = mapping.to.find(payload['user_id'])
        return raise(:not_found_in_database) unless resource

        success! resource
      end

      private

      def token
        auth_header.present? && auth_header.split.last
      end

      def auth_header
        request.headers['Authorization']
      end
    end
  end
end
