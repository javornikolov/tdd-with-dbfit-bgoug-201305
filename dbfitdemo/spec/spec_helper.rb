require_relative '../init_config'

def run_dbfit_suite()
  Dir.chdir( configatron.fitnesse_home ) do
    system("#{configatron.fitnesse_home}/startFitnesse.sh",
      '-o',
      '-f', "#{configatron.project_root}/plugins.properties",
      '-d', "#{configatron.project_root}/target/test/rdbms/dbfit",
      "-c", "BgougDemoSuite?suite&format=text")

    return $?
  end
end

