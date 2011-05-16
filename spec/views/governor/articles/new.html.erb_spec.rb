require 'spec_helper'

class ActionView::Base
  include Governor::Controllers::Helpers
  include GovernorStatesHelper
  
  def params
    {:governor_mapping => :articles}
  end
end

module Governor
  describe "governor/articles/new.html.erb" do
    include Devise::TestHelpers
    
    before(:each) do
      @user = Factory(:user)
      @article = Factory.build(:article, :author => @user)
      assign(:article, @article)
      controller.stubs(:action_name).returns('new')
      sign_in @user
      render
    end
    
    
    it "allows you to set the state" do
      rendered.should =~ /State/
    end
  end
end