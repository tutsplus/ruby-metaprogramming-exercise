 require "test_helper"
 require "metaproject/builder"

module MetaProject
  describe Builder do
    let(:dest) { "/tmp/project" }
    before do
      FileUtils.rm_rf dest
      @builder = Builder.new dest
      @builder.execute
    end

    it "creates the lib folder" do
      assert Dir.exist?("#{dest}/lib"), "Directory #{dest}/lib should exist."
    end

    it "creates the test folder" do
      assert Dir.exist?("#{dest}/test"), "Directory #{dest}/test should exist."
    end
  end
end
