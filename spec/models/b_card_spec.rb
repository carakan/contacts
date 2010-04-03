require File.dirname(__FILE__) + '/../spec_helper'

describe B-card do
  it "should be valid" do
    B-card.new.should be_valid
  end
end
