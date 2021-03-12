# frozen_string_literal: true

describe http('https://jsonplaceholder.typicode.com/todos/1') do
  its('body') { should include '"userId": 1'}
  its('body') { should include '"title": "delectus aut autem"'}
  its('body') { should include '"completed": false'}
  its('body') { should include '"id": 1,'}
  its('status') { should cmp 200 }
end

describe http('GET https://mockend.com/Ed-Davis/basic_inspec_API_test_exampleposts?date_order=desc') do
  its('body') { should include '"title": "Testing APIs is cool"'}
  its('body') { should include '"views": "All my own"'}
  its('body') { should include '"createdAt": "12-03-21"'}
  its('body') { should include '"body": "InSpec can be fun!"'}
  its('status') { should cmp 301 }
end