require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User") }

  subject { @user }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end

    it { should_not be_valid }
  end
end