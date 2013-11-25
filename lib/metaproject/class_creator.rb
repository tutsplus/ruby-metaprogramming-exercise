module MetaProject
  class ClassCreator
    def initialize options, mod = Object
      @mod = mod
      @name = options[:name]
      @attributes = options[:attributes]
    end

    def create
      create_class
      create_attributes
    end

    private

    def create_class
      @klass = @mod.const_set @name.to_s.capitalize, Class.new
    end

    def create_attributes
      @klass.class_eval <<EOF
def initialize #{attributes_as_arguments}
  #{initializing_arguments}
end
EOF
    end

    def attributes_as_arguments
      @attributes.join ", "
    end

    def initializing_arguments
      @attributes.
        map { |attr| "@#{attr} = #{attr}" }.join "\n"
    end
  end
end
