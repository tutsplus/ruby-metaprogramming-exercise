module MetaProject
  class Builder
    attr_reader :destination
    def initialize destination
      @destination = destination
    end

    def execute
      FileUtils.mkdir_p "#{destination}/lib"
      FileUtils.mkdir_p "#{destination}/test"
    end
  end
end
