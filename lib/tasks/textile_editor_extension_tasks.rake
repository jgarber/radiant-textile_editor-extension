namespace :radiant do
  namespace :extensions do
    namespace :textile_editor do
      
      import File.dirname(__FILE__) + "/../../vendor/textile_editor_helper/tasks/textile_editor_helper_tasks.rake"
      
      desc "Runs the migration of the Textile Editor extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          TextileEditorExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          TextileEditorExtension.migrator.migrate
        end
      end

      desc "Copies public assets of the Textile Editor extension to the instance public/ directory."
      task :update => [:environment, "textile_editor_helper:install"] do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[TextileEditorExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(TextileEditorExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end

    end
  end
end