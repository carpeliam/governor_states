class GovernorAddStateTo<%= mapping.singular.to_s.classify.pluralize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= mapping.plural %>, :state, :string
  end

  def self.down
    remove_column :<%= mapping.plural %>, :state
  end
end
