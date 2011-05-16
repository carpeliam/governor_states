require 'rails/generators'
require 'rails/generators/migration'
module Governor
  class AddStateGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    argument :resource, :type => :string, :default => Governor.default_resource.plural.to_s
    desc 'Adds various states (draft, published) to your article.'
  
    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
    
    def create_migration_file
      migration_template 'migrations/add_state_to_articles.rb', "db/migrate/governor_add_state_to_#{mapping.plural}.rb", :skip => true
    end
    
    private
    def mapping
      Governor.resources[resource.pluralize.to_sym]
    end
  end
end