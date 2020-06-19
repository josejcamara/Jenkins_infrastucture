# Number of executors in master
jenkins_script 'set number of executors' do
    command <<-EOF
  import hudson.model.*
  
  // Set executors to twice the number of CPU cores
  Hudson hudson = Hudson.getInstance()
  hudson.setNumExecutors(5)
  hudson.setNodes(hudson.getNodes())
  hudson.save()
    EOF
end

