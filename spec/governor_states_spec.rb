require 'spec_helper'

module Governor
  describe GovernorStates do
    it "registers the plugin" do
      Governor::PluginManager.plugins.size == 1
    end
  end
end