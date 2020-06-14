# InSpec test for recipe jenkins-master::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('jenkins'), :skip do
  it { should exist }
end

# Ports
describe port(80), :skip do
  it { should_not be_listening }
end
describe port(8080), :skip do
  it { should be_listening }
end

describe command('wget -O - http://localhost:8080/login') do
  its(:stdout) { should match(/Jenkins/) }
end
