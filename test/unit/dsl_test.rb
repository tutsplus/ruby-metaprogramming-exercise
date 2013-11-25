require "test_helper"
require "metaproject/dsl"

module MetaProject
  describe DSL do
    it "creates a project" do
      builder = Minitest::Mock.new
      builder.expect :project, nil, [ :blog ]

      dsl = DSL.new builder: builder
      dsl.project :blog

      builder.verify
    end
  end
end
