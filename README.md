# docker-brms
=============
Docker image for version 6.4 of JBoss Enterprise Application Server and version 6.1 of Red Hat BRMS 6

Note: These versions must be the same

### How to build
1. Clone git repository
   https://github.com/mgoodwin1989/docker-brms.git

2. Copy the following binary artifacts to the installs directory

   [jboss-brms-6.1.0.GA-deployable-eap6.x.zip] (https://www.jboss.org/download-manager/file/jboss-brms-6.1.0.GA-deployable.zip)
   
   [jboss-eap-6.4.0.zip] (https://www.jboss.org/download-manager/file/jboss-eap-6.4.0.GA.zip)


3. Run
```sh
   docker-compose build
``` 

4. Run
```sh
   docker-compose up
```

5. Verify installation by accessing
   <http://localhost:8080/business-central>

    
