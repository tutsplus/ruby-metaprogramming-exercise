module MetaProject
  class DSL
    def initialize options = {}
      @builder = options[:builder] || MetaBuilder.new
    end

    def project name, &block
      @builder.project name, &block
      @builder.execute
    end
  end
end
