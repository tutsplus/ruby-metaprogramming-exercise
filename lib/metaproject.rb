require "metaproject/meta_builder"
require "metaproject/dsl"
require "metaproject/class_creator"

MYDSL = MetaProject::DSL.new

def project *args, &block
  MYDSL.project *args, &block
end
