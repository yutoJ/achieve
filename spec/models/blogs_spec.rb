require 'rails_helper'

describe Blog do
  it "is valid with a title" do
    blog = Blog.new(title: "test by Rspec", content: "I am a tester")
    expect(blog).to be_valid
  end

  it "is invalid without a title" do
    blog = Blog.new
    expect(blog).not_to be_valid
  end

  it "is valid with a title" do
    blog = Blog.new
    blog.valid?
    expect(blog.errors[:title]).to include("を入力してください")
  end
end