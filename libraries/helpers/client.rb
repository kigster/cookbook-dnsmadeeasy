require 'dnsmadeeasy'
require 'digest'

module DnsmadeeasyCookbook
  module Helpers
    module Client

      def gem_version
        @gem_version ||= DnsMadeEasy::VERSION
      end

      def client(dme_api_key = nil, dme_api_secret = nil)
        key    = dme_api_key || available_resource.api_key
        secret = dme_api_secret || available_resource.api_secret
        create_client(key, secret)
      end

      def create_client(key, secret)
        ::DnsMadeEasy::Api::Client.new(key, secret)
      end

      def available_resource
        return new_resource if respond_to?(:new_resource)
        return current_resource if respond_to?(:current_resource)
        self
      end

      def with_retries(&_block)
        tries = respond_to?(:api_retries) ? available_resource.api_retries : 1
        begin
          yield
            # Only catch errors that can be fixed with retries.
        rescue DnsMadeEasy::Error
          tries -= 1
          retry if tries > 0
          raise
        end
      end

      def home_path
        Dir.home(node['current_user'])
      end

      def credentials_path
        File.expand_path('~/.dnsmadeeasy/credentials.yml').freeze
      end
    end
  end
end
