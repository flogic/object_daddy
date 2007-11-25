module ActiveRecord #:nodoc:
  module Acts #:nodoc:
    module Authentable
      def self.included(base) # :nodoc:
        base.extend ClassMethods
      end

      module ClassMethods

        def acts_as_authentable
          send :include, AuthentableEntity
        end

        COLUMNS = { :login => :string,
                    :crypted_password => :string,
                    :remember_token => :string,
                    :remember_token_expires_at => :datetime}.freeze

        def add_authentable_fields
          COLUMNS.each do |column, type|
            self.connection.add_column table_name, column, type
          end
        end

        def remove_authentable_fields
          COLUMNS.each_key do |column|
            self.connection.remove_column table_name, column
          end
        end
      end
    end
  end
end
