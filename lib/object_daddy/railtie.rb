module ObjectDaddy
  class Railtie < Rails::Railtie
    railtie_name :object_daddy
    initializer 'object_daddy.extend.activerecord' do
      ::ActiveSupport.on_load :active_record do
        class ::ActiveRecord::Base
          def self.inherited_with_object_daddy(subclass)
            self.inherited_without_object_daddy(subclass)
            subclass.send(:include, ObjectDaddy) unless subclass < ObjectDaddy
          end

          class << self
            alias_method_chain :inherited, :object_daddy
          end
        end
      end
    end
  end
end
