require_relative 'dnsmadeeasy_record'

module DnsmadeeasyCookbook
  class DnsmadeeasyRecordA < DnsmadeeasyRecord
    resource_name :dnsmadeeasy_record_A
    property :type, %w(A), default: 'A', desired_state: false
    property :value, IPV4_ADDR, desired_state: false
  end
end
