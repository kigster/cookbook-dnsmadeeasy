require_relative 'dnsmadeeasy_record'

module DnsmadeeasyCookbook
  class DnsmadeeasyRecordCname < DnsmadeeasyRecord
    resource_name :dnsmadeeasy_record_CNAME
    property :type, %w(CNAME), default: 'CNAME', desired_state: false
    property :value, DNS_VALID_HOSTNAME, desired_state: false
  end
end
