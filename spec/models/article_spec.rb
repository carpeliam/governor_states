require 'spec_helper'

describe Article do
  it "has a default state of 'draft'" do
    Article.unscoped.new.state.should == 'draft'
  end
end