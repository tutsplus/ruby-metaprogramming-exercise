require "test_helper"
require "metaproject"

describe "The integration test" do
  before do
    folder = File.join Dir.pwd, "test/fixtures"
    @output = %x(ruby -Ilib #{folder}/script.rb 2>&1)
  end

  it "creates a module class" do
    @output.must_equal "Created module Blog."
  end

end
