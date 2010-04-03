require File.dirname(__FILE__) + '/../spec_helper'

describe List do
  it "should be valid" do
    List.new.should be_valid
  end
end
