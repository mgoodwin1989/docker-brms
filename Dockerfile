### Set the base image to Fedora
FROM jboss/base-jdk:7

### Install EAP 6.3.0
ADD installs/jboss-eap-6.4.0.zip /tmp/jboss-eap-6.4.0.zip
RUN unzip /tmp/jboss-eap-6.4.0.zip

### Set Environment
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4

### Install BRMS application
ADD installs/jboss-brms-6.1.0.GA-deployable-eap6.x.zip /tmp/jboss-brms-6.1.0.GA-deployable-eap6.x.zip
RUN unzip -o /tmp/jboss-brms-6.1.0.GA-deployable-eap6.x.zip -d $HOME

### Create EAP User
RUN $JBOSS_HOME/bin/add-user.sh admin admin123! --silent

### Create BRMS application users
RUN $JBOSS_HOME/bin/add-user.sh -a brms admin123! --silent
RUN $JBOSS_HOME/bin/add-user.sh -a brmsadmin admin123! --silent

### Add roles to brms application users
RUN echo brmsadmin=admin >> $JBOSS_HOME/standalone/configuration/application-roles.properties
RUN echo brms=analyst >> $JBOSS_HOME/standalone/configuration/application-roles.properties

### Configure EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

# Clean up
#RUN rm -rf /tmp/jboss-*
#RUN rm -rf $INSTALL_DIR/support
#RUN rm -rf $INSTALL_DIR/software

### Open Ports 
EXPOSE 8080 9990 9999 

### Start EAP
ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-full-ha.xml
