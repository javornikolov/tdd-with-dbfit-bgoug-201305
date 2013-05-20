#!/usr/bin/env ruby

require_relative '../init_config'

init()

system( 'sqlldr', "#{configatron.dbuser}/#{configatron.dbpass}", 'control=employee.ctl' )

exit( $?.exitstatus )

