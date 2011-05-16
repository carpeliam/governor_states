require 'governor_states/rails'

states = Governor::Plugin.new('states')

states.register_model_callback do |base|
  base.send :default_scope, base.where(:state => 'published')
  base.state_machine :initial => :draft do
    event :draft do
      transition [:hidden, :published] => :draft
    end
    
    event :publish do
      transition [:draft, :hidden] => :published
    end
    
    event :hide do
      transition :published => :hidden
    end
    
    state :draft do
    end
    
    state :published do
    end
    
    state :hidden do
    end
  end
end

states.register_partial :after_article_description, 'articles/current_state'
states.register_partial :bottom_of_form, 'articles/states_form'

Governor::PluginManager.register states