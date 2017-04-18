with h2 for testing I can use both schema-h2.sql and data-h2.sql.
#spring.jpa.generate-ddl=true
#hibernate.hbm2dll.auto=create-update
#To make work with schema-h2.sql must comment out above two lines and add the "...auto = none"
# http://stackoverflow.com/questions/38040572/spring-boot-loading-initial-data
#to use schema.sql you'll have to disable this feature by adding this to your application.properties
spring.jpa.hibernate.ddl-auto = none

from log result success:
Hibernate: select count(*) as col_0_0_ from person person0_
2017-04-18 11:27:40.714  INFO 8460 --- [           main] c.s.repository.PersonRepositoryTests     : number populated records are=5

\main
│
└───test
    ├───java
    │   └───com
    │       └───subra
    │           │   BootThymeApplicationTests.java
    │           │
    │           ├───controller
    │           └───repository
    │                   PersonRepositoryTests.java
    │
    └───resources
            application.properties
            data-h2.sql
            schema-h2.sql