require_relative '../init_config'

def run_dbfit_suite()
	Dir.chdir( configatron.fitnesse_home ) do
		system( 'java',
			'-jar', "#{configatron.fitnesse_home}/lib/fitnesse-standalone.jar",
			'-d', "#{configatron.project_root}/target/test/rdbms/dbfit",
			"-c", "BgougDemoSuite?suite&format=text" )

		return $?
	end
end

init()

