require File.dirname(__FILE__) + '/../spec_helper'

describe Address do
  it "should be valid" do
    Address.new.should be_valid
  end
end
