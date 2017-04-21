require 'rails_helper'

describe Contact do
  it "is valid" do
    contact = Contact.new(name: "Chris", email: "a@com", content: "yellow")
    expect(contact).to be_valid
  end

  it "is invalid without a name" do
    contact = Contact.new(email: "b@com", content: "fix you")
    expect(contact).not_to be_valid
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email" do
    contact = Contact.new(name: "Martin", content: "scientist")
    expect(contact).not_to be_valid
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  it "is invalid without an content" do
    contact = Contact.new(name: "Coldplay", email: "c@com")
    expect(contact).not_to be_valid
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end