require "test_helper"
require "metaproject"

describe "The integration test" do
  before do
    folder = File.join Dir.pwd, "test/fixtures"
    @output = %x(ruby -Ilib #{folder}/script.rb 2>&1)
  end

  it "creates a module" do
    @output.must_include "Created module Blog."
  end

  it "creates the post class" do
    @output.must_include "Created class Blog::Post."
  end

  it "creates the comment class" do
    skip
    @output.must_include "Created class Blog::Comment."
  end
end
