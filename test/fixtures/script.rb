require "metaproject"

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

post = Blog::Post.new "Hello!", %w(hello first), <<EOF
  We just did Metaprogramming!

  Thank you.
EOF
