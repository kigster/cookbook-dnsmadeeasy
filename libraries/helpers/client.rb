require 'dnsmadeeasy'

module DnsmadeeasyCookbook
  module Helpers
    module Client
      def client(api_key, api_secret)
        ::DnsMadeEasy::Api::Client.new(api_key, api_secret)
      end
    end
  end
end
