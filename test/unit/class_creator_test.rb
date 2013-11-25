require "test_helper"
require "metaproject/class_creator"

module MetaProject
  describe ClassCreator do
    let(:mod) { Module.new }
    let(:klass_name) { :post }
    let(:attributes) { [ :title, :tags ] }

    it "creates a class" do
      options = { name: klass_name, attributes: attributes }

      class_creator = ClassCreator.new options, mod
      class_creator.create

      assert mod::Post
    end
  end
end
