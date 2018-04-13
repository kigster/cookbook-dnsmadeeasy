require_relative 'helpers/client'
require 'dnsmadeeasy'
require 'sym'

module DnsmadeeasyCookbook
  class DnsmadeeasyBase < ::Chef::Resource

    require_relative 'helpers/types'
    require_relative 'helpers/network'

    include ::DnsmadeeasyCookbook::Helpers::Client
    include ::DnsmadeeasyCookbook::Helpers::Types
    include ::DnsmadeeasyCookbook::Helpers::Network

    property :api_key, [String, nil], required: true, desired_state: false
    property :api_secret, [String, nil], required: true, desired_state: false
    property :encryption_key, [String, nil], required: false, desired_state: false

    property :api_retries, [Integer, nil], required: false, default: 1, desired_state: false

    Boolean   = property_type(
      is:      [true, false],
      default: false
    ) unless defined?(Boolean)

    ArrayType = property_type(
      is:     [Array, nil],
      coerce: proc { |v| v.nil? ? nil : Array(v) }
    ) unless defined?(ArrayType)

    declare_action_class.class_eval do
      include ::DnsmadeeasyCookbook::Helpers::Client
      include ::DnsmadeeasyCookbook::Helpers::Types
      include ::DnsmadeeasyCookbook::Helpers::Network
    end

  end
end
