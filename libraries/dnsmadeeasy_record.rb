require_relative 'dnsmadeeasy_base'

module DnsmadeeasyCookbook
  class DnsmadeeasyRecord < DnsmadeeasyBase

    def log_dns_record(action, resource, record_ids = resource.record_ids)
      Chef::Log.warn("#{action}: got DNS record IDs #{record_ids} for domain #{resource.domain}, type #{resource.type}, name #{resource.name}, value #{resource.value}")
    end

    resource_name :dnsmadeeasy_record

    property :name, [String, nil], desired_state: false, name_property: true
    property :domain, DNS_VALID_DOMAIN, desired_state: false, required: true
    property :type, DNS_RECORD_TYPES, required: true, desired_state: false
    property :value, [String, nil], desired_state: false
    property :ttl, [Integer, nil], desired_state: false
    property :record_ids, ArrayType, default: [], desired_state: false

    load_current_value do |resource|
      begin
        with_retries do
          existing_records = client.find_all(resource.domain,
                                             resource.name,
                                             resource.type)
          if existing_records && !existing_records.empty?
            record = existing_records.find { |r| r.name == resource.name }
            if record
              value(record.value)
              ttl(record.ttl)
              record_ids([record.id])
            end
          else
            current_value_does_not_exist!
          end
        end
      rescue DnsMadeEasy::Error
        current_value_does_not_exist!
      end
    end

    action :create do
      converge_if_changed(:value) do
        client.create_record(new_resource.domain,
                             new_resource.name,
                             new_resource.type,
                             new_resource.value,
                             { 'ttl' => new_resource.ttl.to_s })
      end
    end

    action :update do
      converge_if_changed(:value, :ttl) do
        current_resource.record_ids.each do |record_id|
          client.update_record(new_resource.domain,
                               record_id,
                               new_resource.name,
                               new_resource.type,
                               new_resource.value,
                               { 'ttl' => new_resource.ttl.to_s })
        end
      end
    end

    action :delete do
      converge_by "deleting #{new_resource.name}.#{new_resource.domain}" do
        cr = current_resource
        nr = new_resource
        with_retries do
          if !cr.record_ids.empty?
            Chef::Log.warn("deleting DNS records IDs=#{cr.record_ids} for domain #{nr.domain}, type #{nr.type}, name #{nr.name}, value #{nr.value}")
            client.delete_records(nr.domain, cr.record_ids)
          end
        end
      end
    end
  end
end
