FROM jenkins/jenkins:lts

# Executors config
COPY config/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Log config
COPY config/log.properties /var/jenkins_home/log.properties

# Skip install wizard, but still configure a secure Jenkins by creating the admin user
## https://www.jenkins.io/doc/book/managing/system-properties/
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false \
-Djava.util.logging.config.file=/var/jenkins_home/log.properties \
-Dhudson.footerURL=http://mycompany.com"
COPY config/secureAdminUser.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Install this list of plugins
COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt