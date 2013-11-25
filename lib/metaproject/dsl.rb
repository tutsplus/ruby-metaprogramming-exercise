module MetaProject
  class DSL
    def initialize options = {}
      @builder = options[:builder] || MetaBuilder.new
    end

    def project name
      @builder.project name
    end
  end
end
