module DnsmadeeasyCookbook
  class DnsMadeEasyBase < ::Chef::Resource
    require_relative 'helpers/client'
    require_relative 'helpers/types'

    include Helpers::Client
    include Helpers::Types

    ArrayType = property_type(
      is: [Array, nil],
      coerce: proc { |v| v.nil? ? nil : Array(v) }
    ) unless defined?(ArrayType)

    Boolean = property_type(
      is: [true, false],
      default: false
    ) unless defined?(Boolean)

    NonEmptyArray = property_type(
      is: [Array, nil],
      coerce: proc { |v| Array(v).empty? ? nil : Array(v) }
    ) unless defined?(NonEmptyArray)

    ShellCommand = property_type(
      is: [String],
      coerce: proc { |v| coerce_shell_command(v) }
    ) unless defined?(ShellCommand)

    UnorderedArrayType = property_type(
      is: [UnorderedArray, nil],
      coerce: proc { |v| v.nil? ? nil : UnorderedArray.new(Array(v)) }
    ) unless defined?(UnorderedArrayType)

    PartialHashType = property_type(
      is: [PartialHash, nil],
      coerce: proc { |v| v.nil? ? nil : PartialHash[v] }
    ) unless defined?(PartialHashType)


    property :api_key, [String, nil], desired_state: false
    property :api_secret, [String, nil], desired_state: false

    declare_action_class.class_eval do
      include DnsmadeeasyCookbook::Helpers::Client
    end
  end
end
