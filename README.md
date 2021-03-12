# InSpec Overview and Rationale for choosing:

While working on a project with a wide range of technologies (Azure, AWS, Terraform, Scaffold, Workspaces (Linux, Windows)) which is open ended in terms of tech-stack, I wanted to create a framework to address a number of QA dev's challenges but as the lead, wanted the flexibility to move 'resources' (well meaning humans!) between
activity streams, without needing to get in-depth in, e.g. AWS, if they regularly work with Azure.  InSpec is
technologically agnostic, but through it's powerful 'profiles' it can quickly be bent to your will as an AWS Cli framework, a Terraform Testing tool, Machine image testing
(e.g. presence of access ports, bespoke directories), and so on.

With Infrastructure there are often details in the 
configuration which are not of concern, so for example, an AWS Spec auto-discover can provide an overwhelming maintenance burden.  The proposal with this framework 
is to only include the absolute essential requirements which must be checked on build.  For example, a route in a NACL which must persist when other resources or 
deployed/redeployed, in order to ensure a critical service remains functional.

The use of a common 'spec' interface is very human readable and using a common declaration structure hopes to make QA resources more flexible on complex projects.

## Example InSpec Profile

This example shows the implementation of an InSpec profile.

- Initialise your environment, install RVM and Ruby 3.0.0 or greater, and set that version as current/default.

- Install Bundler and do a bundle install.  This will install the required gems from the gemfile.

- Initialise your InSpec profile by typing ```inspec init profile <name>```

More details on InSpec profiles can be found here: https://docs.chef.io/inspec/profiles/

### About Profiles

InSpec uses 'convention over configuration' so creates the folders you need as well as a profile and Readme for that profile.
You Wll then need to edit your profile, for example, with loging credentials, a cloud provider or target OS.

To execute the test tests in 'basic_API_test_spec.rb' use: 

```inspec exec basic_API_test_spec.rb```

InSpec can automatically pick up tests, so the _spec.rb naming convention is important.

If the tests are successfully run, you should see:

```Profile: tests from basic_API_test_spec.rb (tests from basic_API_test_spec.rb)
Version: (not specified)
Target:  local://

  HTTP GET on https://jsonplaceholder.typicode.com/todos/1
     ✔  body is expected to include "\"userId\": 1"
     ✔  body is expected to include "\"title\": \"delectus aut autem\""
     ✔  body is expected to include "\"completed\": false"
     ✔  body is expected to include "\"id\": 1,"
     ✔  status is expected to cmp == 200

Test Summary: 5 successful, 0 failures, 0 skipped
```

Try changing the test, for example, make this:
```its('status') { should cmp 200 }```
Look like this, instead:
```its('status') { should cmp 301 }```

...and you will see the actual retrieved value versus what was expected.

```Profile: tests from basic_API_test_spec.rb (tests from basic_API_test_spec.rb)
Version: (not specified)
Target:  local://

  HTTP GET on https://jsonplaceholder.typicode.com/todos/1
     ✔  body is expected to include "\"userId\": 1"
     ✔  body is expected to include "\"title\": \"delectus aut autem\""
     ✔  body is expected to include "\"completed\": false"
     ✔  body is expected to include "\"id\": 1,"
     ×  status is expected to cmp == 301
     
     expected: 301
          got: 200
     
     (compared using `cmp` matcher)


Test Summary: 4 successful, 1 failure, 0 skipped
```

Congratulations!  You've just tested an API call to jsonplaceholder.  Now get going with your own endpoint and look at authentication in InSpec. More details can be found here: https://docs.chef.io/inspec/config/




