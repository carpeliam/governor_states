module GovernorStates
  class Engine < ::Rails::Engine
    config.to_prepare do
      Governor::ArticlesController.helper GovernorStatesHelper
    end
  end
end