require "test_helper"
require "metaproject/meta_builder"

module MetaProject
  describe MetaBuilder do
    let(:dest) { "/tmp/project" }
    let(:builder) { MetaBuilder.new }

    it "spawns a new project" do
      builder.project :blog
      builder.execute

      Blog.must_be_kind_of Module
    end

    it "spawns a new class" do
      builder.project :blog do
        klass :post
      end

      builder.execute

      Blog::Post.must_be_kind_of Class
    end

    it "spawns a new class with attributes" do
      builder.project :blog do
        klass :post do
          attribute :title
        end
      end

      builder.execute

      post = Blog::Post.new "Title"
      post.instance_variable_get(:@title).must_equal "Title"
    end
  end

end
