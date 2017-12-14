require_relative 'dnsmadeeasy_base'

module DnsmadeeasyCookbook
  class DnsmadeeasyRecord < DnsmadeeasyBase

    resource_name :dnsmadeeasy_record

    property :name, [String, nil], desired_state: false, name_property: true
    property :domain, DNS_VALID_DOMAIN, desired_state: false, required: true
    property :type, DNS_RECORD_TYPES, required: true, desired_state: false
    property :value, [String, nil], desired_state: false
    property :ttl, [Integer, nil], desired_state: false

    property :unique, [Boolean], default: false, desired_state: false
    property :record_ids, ArrayType

    load_current_value do
      begin
        with_retries do
          existing_record_ids = client.find_record_id(new_resource.domain,
                                                      new_resource.name,
                                                      new_resource.type)
          if existing_record_ids
            domain new_resource.domain
            name new_resource.name
            type new_resource.type
            ttl new_resource.ttl
            record_ids existing_record_ids
          end
        end
      rescue DnsMadeEasy::Error
        current_value_does_not_exist!
      end
    end

    action :update do
      converge_if_changed do
        action_delete
        action_create
      end
    end

    action :create do
      client.create_record(new_resource.domain,
                           new_resource.name,
                           new_resource.type,
                           new_resource.value,
                           { 'ttl' => new_resource.ttl.to_s })
    end

    # Deletes the DNS Record
    action :delete do
      return unless current_resource
      converge_by "deleting #{new_resource.domain}" do
        with_retries do
          current_resource.network.delete
        end
      end
      client.create_record(new_resource.domain,
                           new_resource.name,
                           new_resource.type,
                           new_resource.value,
                           { 'ttl' => new_resource.ttl.to_s })

    end

    # This will only create a record if one isn't already there with the same
    # name and type, but not value.
    action :create_if_missing do

    end
  end
end
