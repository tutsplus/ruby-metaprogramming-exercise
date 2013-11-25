module MetaProject
  class MetaBuilder
    def initialize
      @klasses = []
    end

    def project name, &block
      @project = name
      self.instance_eval &block if block_given?
    end

    def execute
      mod = Object.const_set @project.capitalize, Module.new
      @klasses.each do |klass|
        ClassCreator.new(klass, mod).create
      end
    end

    def klass name, &block
      @attributes = []
      self.instance_eval &block if block_given?
      @klasses << { name: name, attributes: @attributes.dup }
      @attributes.clear
    end

    def attribute name
      @attributes << name
    end
  end
end
