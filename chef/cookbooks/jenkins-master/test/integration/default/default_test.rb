# InSpec test for recipe jenkins-master::default
# https://www.inspec.io/docs/reference/resources/nginx/

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe command('curl localhost') do
  its(:stdout) { should match(/<h1>hello world/) }
end

# describe package("nginx") do
#   it { should be_installed } # the package should be installed
# end

# describe file("/etc/nginx/sites-available/default") do
#   it { should exist } # the configuration file should exist
# end

# describe command("curl localhost") do
#   its("stdout") { should match "404 Not Found" }
#   # nginx must send back 404 at our request
# end