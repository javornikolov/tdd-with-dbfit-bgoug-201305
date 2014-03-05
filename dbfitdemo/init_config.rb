require 'configatron'

def init()
  init_custom_config()
end

def init_custom_config()
  parent_folder = File.expand_path( File.dirname( File.dirname( __FILE__ ) ) )
  custom_config = File.join( parent_folder, 'config.rb' )

  require custom_config if File.file?(custom_config)
end
