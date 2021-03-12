# frozen_string_literal: true

describe http('https://jsonplaceholder.typicode.com/todos/1') do
  its('body') { should include '"userId": 1'}
  its('body') { should include '"title": "delectus aut autem"'}
  its('body') { should include '"completed": false'}
  its('body') { should include '"id": 1,'}
  its('status') { should cmp 200 }
end
