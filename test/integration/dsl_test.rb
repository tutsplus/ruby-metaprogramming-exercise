require "test_helper"
require "metaproject"

describe MetaProject::DSL do
  before do
    @dsl = MetaProject::DSL.new
    @dsl.project :blog do
      klass :post
    end
  end

  it "creates the Blog module" do
    assert Blog
  end

  it "creates the Blog::Post class" do
    assert Blog::Post
  end

end
