require 'dnsmadeeasy'

module DnsmadeeasyCookbook
  module Helpers
    module Types

      class UnorderedArray < Array
        def ==(other)
          # If I (desired env) am a subset of the current env, let == return true
          other.is_a?(Array) && all? { |val| other.include?(val) }
        end
      end

      class ShellCommandString < String
        def ==(other)
          other.is_a?(String) && Shellwords.shellwords(self) == Shellwords.shellwords(other)
        end
      end

      class PartialHash < Hash
        def ==(other)
          other.is_a?(Hash) && all? { |key, val| other.key?(key) && other[key] == val }
        end
      end
    end
  end
end
