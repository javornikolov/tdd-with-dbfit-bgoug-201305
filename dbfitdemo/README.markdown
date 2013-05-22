## Demo project

Content description:
 * `src/main/rdbms/oracle` - database objects DDL
 * `src/test/rdbms/dbfit` - DbFit tests
 * `loaderdemo` - scripts for loading a file with `SQL*Loader`
 * `command-line-fixture` - sub-project with source of
   [CommandLineFixture by Bob Martin](http://fit.c2.com/wiki.cgi?CommandLineFixture)
  - Used by the SQL*Loader example
  - Compiled .jar is provided under `dist`

### Running demo DbFit tests

#### Prerequisites
* [Java SE](http://www.oracle.com/technetwork/java/javase/downloads/index.html) -
  version >=6 (tested with 7)
  - JRE should be enough for running tests
  - If compiling CommandLineFixture - install JDK (includes JRE)
* Oracle JDBC Driver >= 11.2.0.3 (ojdbc6.jar).
  - [download page](http://www.oracle.com/technetwork/database/features/jdbc/index-091264.html)
  - Or take it from `$ORACLE_HOME/jdbc/lib`
* Oracle Database instance & schema is needed
  (with privileges to connect and create table,view,trigger,pl/sql)
* [DbFit](http://benilovj.github.io/dbfit) >= 2.x
  - Follow installation instructions of DbFit (download, unzip)
  - Copy ojdbc6.jar inside DbFit's lib directory
  - Copy the provided CommandLineFixture `.jar` from `dist` to DbFit's lib
  - Add DemoDBConnection.properties in DbFit folder
    (use DemoDBConnection.properties.sample as example)

#### Running DbFit server & running tests from browser

* Use [../run_fitnesse.sh](../run_fitnesse.sh) as example how to run DbFit in order to
  serve the content under [src/test/rdbms/dbfit](src/test/rdbms/dbfit)
* Navigate to the appropriate URL via browser

#### Advanced setup
This is needed to use some of the build/run scripts automating the tasks of
deploying db objects and running tests.

* Install Ruby (tested with version 2.0)
* Copy `config.rb.sample` to the parent folder with name `config.rb` and edit
the file accordingly
* Install related ruby gems:

```
cd dbfitdemo
bundle install
```

Having that:
* `rake all` - deploys all rdbms artefacts and runs DbFit tests from command line
* `guard` - monitors source folders and runs the above automatically on file
  modification
  - I'm not sure if `guard` is available on Windows.

#### Manual setup
The database sources should be loaded into the relevant schema. (Look at
`Rakefile` for example - it's using `setup/setup_main.sql` to deploy them)


#### SQL*Loader test
This is using some platform-specific stuff under `loaderdemo` (works on Linux).
(May need to tweak it - e.g. convert to .bat in order to run on Windows)


### In order to build CommandLineFixture:
```
cd dbfitdemo
buildr package
```

In general this is not needed since a pre-built .jar file is provided under `dist`.

