require File.dirname(__FILE__) + '/../spec_helper'

describe Phone do
  it "should be valid" do
    Phone.new.should be_valid
  end
end
