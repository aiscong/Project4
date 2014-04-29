require 'spec_helper'

describe Gallery do
    let(:user) { FactoryGirl.create(:user) }
   before { @gallery = user.galleries.build(name: "Lorem ipsum") }

  subject { @gallery }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @gallery.user_id = nil }
    it { should_not be_valid }
  end
   describe "when user_id is not present" do
    before { @gallery.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @gallery.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @gallery.name = "a" * 41 }
    it { should_not be_valid }
  end
end
