require_relative 'dns_made_easy_base'

module DnsmadeeasyCookbook
  class DnsMadeEasyRecord < DnsMadeEasyBase

    resource_name :record

    property :name, [String, nil], desired_state: false, name_property: true
    property :type, [String, nil], desired_state: false
    property :value, [String, nil], desired_state: false
    property :ttl, [Integer, nil], desired_state: false

  end
end
