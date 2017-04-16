How [steps] to fix springboot app to run in external tomcat7 as war/exploded
[1]
pom.xml 
<packaging>war</packaging> 
<java.version>1.7</java.version>
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-tomcat</artifactId>
	<scope>provided</scope>
</dependency>
[2]
project properties facets: dynamicWebWodule:3.0, java.version same as pom.xml tomocat7 must support java version

console error log: "INFO: 2 Spring WebApplicationInitializers detected on classpath" ... "INFO: Server startup in 8473 ms" But no springboot banner and get request receives 404
[3] Must extends SpringBootServletInitializer as below to add in the application either on configuration java file or as aseparate file.

public class ServletInitializer extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BootThymeApplication.class);
	}

	
}
Result GET http://localhost:8080/boot-thyme/hello 200 OK:

