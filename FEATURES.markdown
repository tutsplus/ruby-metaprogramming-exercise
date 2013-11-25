Let's build a project builder
=============================

Requirements
------------

* Modules
* Dynamic class creation
* Dynamic method definition
* DSL (`instance_eval`, `class_eval`, blocks)
* Message delegation
* Method missing

Features
--------

* Create a file structure with `lib`, `test` and `doc`.
* Create a class with the appropriate lib and test files.
  - Specify the class attributes, their types and assert on their types.

Example
-------

Given a script like below:

    require 'metaproject'

    project :blog do
      klass :post do
        attribute :title, String
        attribute :body, String
        attribute :tags, Array
      end

      klass :comment do
        attribute :author, String
        attribute :created_at, Time
        attribute :post_id, Fixnum
      end
    end

When I run the script:

    $ ruby script.rb

Then the following is supposed to be true:

1. A project structure with:

        lib/
          ├ post.rb
          └ comment.rb
        test/
          ├ post_test.rb
          └ comment_test.rb
        Rakefile

2. The post test file should contain:

        describe Post do
          it "has a title" do
            Post.new.title.must_be_kind_of String
          end

          it "has a list of tags" do
            Post.new.tags.must_be_kind_of Array
          end

          it "has a body" do
            Post.new.body.must_be_kind_of String
          end
        end

3. The `Post` class should contain:

        class Post
          def initialize title, tags, body
            @title = title
            @tags = tags
            @body = body
          end
        end

4. Points 2 and 3 should be also truthful for the `Comment` class, with the
respective attributes.

5. The Rakefile should allow `rake` to run the test suite, meaning the `test`
task should be the default one.
