module GovernorStatesHelper
  def options_for_state(article)
    [article.state] + article.state_transitions.map{|t| t.to_name }
  end
end
