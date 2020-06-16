Chef::Log.debug '[JENKINS] Configuring Plugins...'

# This resource does not install plugin dependencies from a a given hpi/jpi URL or a specific version
# - you must specify all plugin dependencies or Jenkins may not startup correctly!

plugins_list = [
  {'name' => 'mailer', 'version' => '1.32', 'deps' => [] },
  {'name' => 'credentials', 'version' => '2.3.8', 'deps' => [] },
  {'name' => 'jdk-tool', 'version' => '1.4', 'deps' => [] },
  {'name' => 'token-macro', 'version' => '2.12', 'deps' => [] },
  {'name' => 'durable-task', 'version' => '1.34', 'deps' => [] },
  {'name' => 'docker-plugin', 'version' => '1.2.0', 'deps' => ['docker-commons', 'ssh-slaves', 'apache-httpcomponents-client-4-api', 'docker-java-api', 'bouncycastle-api'] },
  {'name' => 'simple-theme-plugin', 'version' => '0.6', 'deps' => [] }
]

plugins_list.each do |plugin|
  plugin['deps'].each do |dep|
    jenkins_plugin dep
  end
  jenkins_plugin plugin['name'] do
    version plugin['version']
  end
end

# Restart to apply changes
jenkins_command 'safe-restart'
