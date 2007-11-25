module ObjectDaddy

  def self.included(klass)
    klass.extend ClassMethods
    if defined? ActiveRecord and klass < ActiveRecord::Base
      klass.extend RailsClassMethods    
      
      class << klass
        alias_method :validates_presence_of_without_object_daddy, :validates_presence_of
        alias_method :validates_presence_of, :validates_presence_of_with_object_daddy
      end   
    end
  end
    
  module ClassMethods
    attr_accessor :exemplars_generated, :exemplar_path, :generators
    protected :exemplars_generated=
    
    # create a valid instance of this class, using any known generators
    def generate(args = {})
      self.gather_exemplars unless exemplars_generated
      if self.generators
        self.generators.each_pair do |handle, generator|
          next if args[handle]
          if generator[:block]
            if generator[:start]
              generator[:prev] = args[handle] = generator[:start]
              generator.delete(:start)
            else
              generator[:prev] = args[handle] = generator[:block].call(generator[:prev])
            end
          elsif generator[:method]
            args[handle] = self.send(generator[:method])
          elsif generator[:class]
            args[handle] = generator[:class].next
          end
        end
      end
      if @presence_validated_attributes
        req = {}
        (@presence_validated_attributes.keys - args.keys).each {|a| req[a] = true } # find attributes required by validates_presence_of not already set
        missing = reflect_on_all_associations.to_a.select {|a| a.macro == :belongs_to }.select {|a| req[a.name] } # limit to those which are belongs_to associations
        missing.each {|a| args[a.name] = a.class_name.constantize.generate }
      end
      self.new(args)
    end

    # register a generator for an attribute of this class
    # generator_for :foo do ... end
    # generator_for :foo, :class => GeneratorClass
    # generator_for :foo, :method => :method_name
    def generator_for(handle, args = {}, &block)
      raise ArgumentError, "an attribute name must be specified" unless handle = handle.to_sym
      self.generators ||= {}
      raise ArgumentError, "a generator for attribute [:#{handle}] has already been specified" if self.generators[handle]

      if args[:method]
        raise ArgumentError, "generator method :[#{args[:method]}] is not known" unless self.respond_to?(args[:method].to_sym)
        self.generators[handle] = { :method => args[:method].to_sym }
      elsif args[:class]
        raise ArgumentError, "generator class [#{args[:class].name}] does not have a :next method" unless args[:class].respond_to?(:next)
        self.generators[handle] = { :class => args[:class] }
      elsif block
        raise ArgumentError, "generator block must take a single argument" unless block.arity == 1
        h = { :block => block }
        h[:start] = args[:start] if args[:start]
        self.generators[handle] = h
      else
        raise ArgumentError, "a block, :class generator, or :method generator must be specified to generator_for"
      end
    end
    
  protected
    
    def gather_exemplars
      self.exemplars_generated = true
      path = File.join(exemplar_path, "#{underscore(self.name)}_exemplar.rb")
      load(path) if File.exists?(path)
    end
    
    # we define an underscore helper ourselves since the ActiveSupport isn't available if we're not using Rails
    def underscore(string)
      string.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    end
  end
  
  module RailsClassMethods
    def exemplar_path
      File.join(RAILS_ROOT, 'test', 'exemplars')
    end
    
    def validates_presence_of_with_object_daddy(*attr_names)
      @presence_validated_attributes ||= {} 
      attr_names.each {|a| @presence_validated_attributes[a] = true }
      validates_presence_of_without_object_daddy(attr_names)
    end
  end
end
