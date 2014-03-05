require 'configatron_plus'

def init()
  init_custom_config()
  ConfigatronPlus.fetch_sources
end

def init_custom_config()
  parent_folder = File.expand_path( File.dirname( File.dirname( __FILE__ ) ) )
  custom_config = File.join( parent_folder, 'config.rb' )

  if File.file?( custom_config )
    configatron.configatron_plus.source_files = { :current => custom_config }
  end
end

