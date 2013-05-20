title: Agenda
class: big

- Concepts (Testing, Test-Driven Development)
- DbFit
- Demo

---

title: What is a legacy system?

* You spot an obvious design problem
* know how to improve that,
* but the thought about consequences gives you a stomach ache.

&nbsp;<footer class="source">source: [Gojko Adzic, "Fighting the monster"](http://gojko.net/2007/11/20/fighting-the-monster)</footer>

---

class: image

![Agile Testing Quadrants](images/bgoug/Agile-Testing-Quadrants.png)

&nbsp;<footer class="source">source: [http://lisacrispin.com/2011/11/08/using-the-agile-testing-quadrants](http://lisacrispin.com/2011/11/08/using-the-agile-testing-quadrants)

---

title: Why (automated) testing?

* Makes application change easier
* Safety net - provides confidence/removes fear
* Documentation
* Help to localize where exactly a defect is located
* Reduce the chance of new bugs
* Automation enables earlier feedback, saves time, helps focusing on solving the
  main problem. (Not everything is feasible to automate)

---

title: Test Fixture

* All the things we need to have in place in order to run a test and expect a particular outcome
* The test context

---

title: System Under Test (SUT)

The system that is being tested

---

title: Test execution cycle
build_lists: true

1. Arrange (set up the Fixture)
2. Act (exercise the System Under Test)
3. Assert (verify results are <b>as expected</b>)
4. Tear Down the fixture (to isolate other tests from this one)

---

title: Unit test

* Tests small individual unit (module, procedure/function)
* In isolation (no interaction with other units)
* Should run quickly (otherwise people won't run them)

---

title: Integration test

* Tests several modules as a <b>group</b>
* Slower than unit tests (usually)

---

title: Acceptance test

* Conducted to determine whether or not a system satisfies its <b>acceptance criteria</b>
* and to enable the customer to determine whether or not to accept the system.
* At least modeled and possibly even written by the <b>customer</b>
* End-to-end (slower than Integration & Unit tests)

---

title: Regression tests
subtitle: (<b>Re</b>gress vs progress)

Performed to make sure that <b>previously working functionality still works</b> after
changes elsewhere in the system

---

title: Refactor

Is the the process of changing a system in such a way that

* doesn't alter external behaviour
* and improves it's internal structure (design)
* through <b>small steps</b>

Doing refactoring without tests is unsafe

---

title: TDD Cycle
class: image

![TDD Cycle](images/bgoug/tddcycle.gif)

<footer class="source">source: Internet</footer>

---

title: Tests are not the main product in TDD

* TDD is a <b>design</b> technique
* The <b>design</b> emerges in <b>small steps</b>

---

title: Why test first?

* Start with end in mind (think from point of view of <b>caller</b>)
* This perspective helps for better design
* Test coverage is useful byproduct
* Greatly reduces the need of debugging

---

title: Cost of change (traditional)
class: Image

![Traditional Life Cycle](images/bgoug/costOfChangeTraditional.gif)

---

title: Cost of change (test early)
class: Image

![Agile Life Cycle](images/bgoug/costOfChangeAgile.gif)

---

title: Why testing the Database?

* For lot of businesses, data held in DB are the most vital commercial asset
  they have
* Business critical functions rely on this data
* So it makes sense to validate that data is stored and processed correctly

---

title: Challenges of Database testing...

* Bad tools
     - Too much boilerplate code
     - OO tools not directly applicable for RDBMS
* Inherently hard to test. Isolation is difficult
     - Changes are persistent
     - Shared environment
     - Triggers, Constraints
* Attitude ("it's not my job")

---

title: How to isolate db tests?
subtitle: Run tests in one transaction

* Makes them repeatable and independent
* When one transaction is not an option - clean up after tests

---

title: How to isolate db tests (2)?
subtitle: Dedicated database

* One db per contributor
* Separate schemas
* Shared Dev db may work too
* As a rule - avoid running tests on top of production

---

title: Other Tips

* Make tests self-sufficient
* Don't count on the order of tests
* Prepare everything you need for the test in its set-up

---

title: DbFit
class: segue dark

---

title: What is DbFit?

* Initially created by Gojko Adzic:
    - to enable efficient database testing
    - motivate database developers to use an automated testing framework
* Enables manipulating database objects and defining tests in <b>tabular form</b>
* Open source [https://github.com/benilovj/dbfit](https://github.com/benilovj/dbfit)

---

title: DbFit, FIT and FitNesse

* DbFit is based on FIT+FitNesse+DB Fixtures which enable FIT/Fitnesse tests to execute
  directly against a database.
* FIT is Acceptance testing framework
    - customer oriented
    - tests are described as tables
* FitNesse is Wiki-web based front-end for FIT

---

title: FitNesse architecture
class: image

![FitNesse Architecture](images/bgoug/fitnesse_architecture.jpg)
<footer class="source">source: [Fittnesse User Guilde - One Minute Description](http://www.fitnesse.org/FitNesse.UserGuide.OneMinuteDescription)</footer>

---

title: What is DbFit Fixture?

* A fixture is interface between:
    - the test instrumentation (Fit framework),
    - test cases (Fit tables),
    - and the system under test (e.g. a database stored procedure)
* In general there is 1:1 mapping between Fit table and fixture

---

title: Why DbFit?

* Easy to use (even for non-technical people)
    - Tests expressed and managed as tables
    - Web-Wiki front-end
* Provides all the plumbing:
    - Transaction management
    - Features based on meta-data
    - Parameter mapping
* Runs inside FitNesse - already integrated with lots of other tools/libraries

---

title: What is Wiki?

* The simplest online database that could possibly work. - Ward Cunningham
* Allows users to freely create and edit Web page content using any Web browser
* A group communication mechanisms
* Encourages democratic use of the Web and promotes content composition by
nontechnical users

&nbsp;<footer class="source">source: [http://wiki.org/wiki.cgi?WhatIsWiki](http://wiki.org/wiki.cgi?WhatIsWiki)</footer>

---

title: Fitnesse Wiki

* Hierarchies - SubWiki, Test Suites
* Page types - Suite, Test, Static
* Some special pages:
    - PageHeader, PageFooter
    - SetUp, TearDown, SuiteSetUp, SuiteTearDown
    - Inherited recurively by default; can be overriden
* [http://fitnesse.org/FitNesse.UserGuide](http://fitnesse.org/FitNesse.UserGuide)

---

title: A Unit test with DbFit

1. Set up the input data (<b>arrange</b>).
2. Execute a function or procedure (<b>act</b>).
3. Run a query and compare actual vs expected data (<b>assert</b>).

---

title: Basic commands of DbFit

* Query
* Insert
* Update
* Execute Procedure
* Execute

---

title: Advanced features

* Inspect queries, tables, procedures to auto-generate test tables and regression
tests
* Store and compare queries
* Standalone mode for full control

---

title: Getting started

1. Needs Java to run
2. Download: [http://benilovj.github.io/dbfit](http://benilovj.github.io/dbfit)
3. Unzip
4. Copy Oracle JDBC driver (ojdbc6.jar) to <b>lib</b> subfolder
5. Run the startup script (startFitnesse.sh or startFitnesse.bat)
6. Access via web browser - http://localhost:8085

---

title: Connecting to the database

Inline configuration:
<pre class="prettyprint">
!|Connect|localhost:1521|username|password|dbname|
</pre>

Using properties file:
<pre class="prettyprint">
!|ConnectUsingFile|DBConnection.properties|
</pre>

<pre class="prettyprint">
service=localhost:1521
username=username
password=password
database=dbname
</pre>

---
title: Query

<pre class="prettyprint">
!|insert|testtbl|
|n      |name   |
|1      |NAME1  |
|3      |NAME3  |
|2      |NAME2  |

!|query|select * from testtbl|
|n     |name                 |
|1     |NAME1                |
|3     |NAME3                |
|2     |NAME2                |
</pre>

---
title: Ordered Query
class: image

<pre class="prettyprint">
!|Ordered Query|select * from testtbl order by n|
|n             |name?                           |
|1             |NAME1                           |
|3             |NAME3                           |
|2             |NAME2                           |
</pre>

![Ordered Query Test](images/bgoug/ordered_query_test.png)

---
title: Insert

<pre class="prettyprint">
!|insert|testtbl|
|n      |name   |
|1      |NAME1  |
|3      |NAME3  |
|2      |NAME2  |
</pre>

---
title: Execute Procedure

<pre class="prettyprint">
!2 No parameters
!|Execute Procedure|do_stuff|

!2 Functions - return values with "?"
!|Execute Procedure|zlpad_notrunc        |
|p_str             |p_padded_len|?       |
|'12'              |5           |'00012' |

!2 OUT parameters - "?" suffix
!|Execute Procedure|split_name|
|p_fullname |p_first_name?|p_last_name?|
|Mikey Mouse|Mickey       |Mouse       |

!2 IN OUT parameters - specify twice
!|Execute Procedure|make_double|
|x|x?|
|3|6 |
</pre>

---

title: Expect exception

<pre class="prettyprint">
!2 Expect ORA-20013
!|Execute procedure <b>expect exception</b>|set_age|<b>20013</b>|
|p_age                                            |
|-5                                               |
</pre>

---

title: Parameters and fixture symbols

* `set parameter` to set parameter directly
* `>>paramname` - store a value
* `<<paramname` - read the value

<pre class="prettyprint">
!|set parameter|ONE|1|

!|query|select sysdate mytime from dual|
|mytime?                               |
|<b>>>current_time</b>                      |

!|query|select count(*) cnt from dual where sysdate >= <b>:current_time</b>|
|cnt                                                                 |
|<b>&lt;&lt;ONE</b>                                                               |
</pre>

---
title: Store Query

<pre class="prettyprint">
!|Store Query|select 1 n from dual union select 2 n from dual|firsttable|

!|query|&lt;&lt;firsttable|
|n                  |
|1                  |
|2                  |

</pre>

---
title: Compare Stored Queries

<pre class="prettyprint">
!|insert|testtbl|
|n      |name   |
|1      |NAME1  |
|3      |NAME3  |
|2      |NAME2  |

|Store Query|select * from testtbl|fromtable|

|Store Query|!- select 1 n, 'name1' name from dual|fromdual|
<b>
|compare stored queries|fromtable|fromdual|
|name                  |n?                |
</b>
</pre>

   - Use <b>?</b> suffix for non-key columns

---
title: Working Modes of fixtures

* Flow
* Standalone

---
title: Working Modes of fixtures (2)
subtitle: Flow mode

* A <b>DatabaseTest</b> fixture controls the whole page and coordinates
testing
    - OracleTest, MysqlTest, DerbyTest, DB2Test, ...
* Automatic rollback at the end (manual commit or rollback is still possible)
* Better isolation
* Some additional features such as inspections of stored procedure error
results

---
title: Working Modes of fixtures (3)
subtitle: Standalone mode

* We are responsible for transaction management
* Enables more control over the database testing process
* Allows using other individual fixtures
* We can supply our own database connection to make sure that (Java)
integration tests are running in the same transaction

---

title: Connecting to databse

<pre class="prettyprint">
<b>!3 In Flow mode</b>
!|dbfit.OracleTest|
!|Connect|ourhost:1521|dbusername|dbpassword|mydb|

# Alternatively - TNS descriptor can be used:
#!|Connect|(DESCRIPTION=(ADDRESS=...))|
</pre>

<pre class="prettyprint">
<b>!3 In Standalone mode</b>
|import fixture|
|dbfit.fixture|
!|DatabaseEnvironment|oracle|
|connect|localhost:1521|dbusername|dbpassword|mydb| </pre>

---
title: Integration test with SQL*Loader

* Compile CommandLineFixture (by Bob Martin)
* Use it to run a shell script

<pre class="prettyprint">
!3 Load some data with Oracle SQL*Loader
|com.objectmentor.fixtures.CommandLineFixture       |
|command|${PROJECT_ROOT}/loaderdemo/load_employee.sh|


!|Query|select * from employee   |
|id    |name? |dept?     |salary?|
|100   |Thomas|Sales     |5000   |
|200   |Jason |Technology|5500   |
|300   |Mayla |Technology|7000   |
|400   |Nisha |Marketing |9500   |
|500   |Randy |Technology|6000   |
|501   |Ritu  |Accounting|5400   |
</pre>

---

title: Automating tests execution

* Running tests from command line
<pre class="prettyprint">
java -jar fitnesse-standalone.jar \
    -d "${TESTS_DIR}" \
    <b>-c "BgougDemoSuite?suite&format=text"</b>
</pre>

* Run <b>test</b> or <b>suite</b> as RESTful service
  [http://fitnesse.org/FitNesse.UserGuide.RestfulServices](http://fitnesse.org/FitNesse.UserGuide.RestfulServices)
* JUnit

---

title: How tests are stored?

* Simple text files
* <b>content.txt</b> - test definition and other Wiki content
* <b>properties.xml</b> - metadata (Test, Sute)
* Easy to put under version control

---

title: Demo
class: segue dark

---

title: Summary

* Changes of database code and schema are often relatively hard
* This makes the systems considered <b>legacy</b>
* TDD stimulates designing cleaner and easier to change code
* Development of RDBMS artefacts is lagging when it comes to
  engineering practices and tools
* DbFit can help

---

title: Resources
content_class: smaller

* [http://benilovj.github.io/dbfit](http://benilovj.github.io/dbfit/) - with links to:
    - download DbFit
    - docs, getting started information
    - mailing list - don't hesitate to participate and ask questions
    - code repository at github - reports for problems, suggestions and contributions are welcome
* [https://github.com/javornikolov/tdd-with-dbfit-bgoug-201305](https://github.com/javornikolov/tdd-with-dbfit-bgoug-201305)
* [http://gojko.net/2007/11/20/fighting-the-monster](http://gojko.net/2007/11/20/fighting-the-monster)
* [http://www.agiledata.org/essays/tdd.html](http://www.agiledata.org/essays/tdd.html), [http://www.agiledata.org](http://www.agiledata.org)
* <b>Test Driven Development: By Example</b>, Kent Beck
* <b>Refactoring Databases - Evolutionary Database Design</b>, Scott W. Ambler, Pramodkumar J. Sadalage

