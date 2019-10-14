# Lab 3: Protecting passwords

## Prerequisites

You must have completed Lab-2 successfully. Each lab builds on the previous lab. 

```
cd ~/environment/arc322/router
```

## What are we doing?

In the previous lab, you might have noticed we had put broker password in plain text. Obviously, this is not a good security practice. In this lab, we will be using another Camel component to encrypt the passwords, AWS accessKeyId and secretKey. 

## Add dependencies

Our project depends on various java libraries to run. These dependencies are managed by Maven. Add the following lines to ```pom.xml`` file in the ```<dependencies>``` block.

```
<dependency>
    <groupId>org.apache.camel</groupId>
    <artifactId>camel-jasypt</artifactId>
    <version>2.24.2</version>
</dependency>
```

## Add Jasypt bean

Add the following lines to ```router/src/main/resources/META-INF/spring/camel-context.xml``` under ```<beans>``` 

```
<!-- define the jasypt properties parser with the given password to be used -->
<bean id="jasypt" class="org.apache.camel.component.jasypt.JasyptPropertiesParser">
    <property name="password" value="sysenv.CAMEL_MASTER_PASSWORD"/>
</bean>

<!-- define the camel properties component -->
<bean id="properties" class="org.apache.camel.component.properties.PropertiesComponent">
    <!-- the properties file is in the classpath -->
    <property name="location" value="classpath:secrets.properties"/>
    <!-- and let it leverage the jasypt parser -->
    <property name="propertiesParser" ref="jasypt"/>
</bean>
```

## Encrypt passwords and store them in a properties file.

```
export CAMEL_MASTER_PASSWORD=<Ask the session speaker for password>
java -jar camel-jasypt-2.24.2.jar -c encrypt -p $CAMEL_MASTER_PASSWORD -i mq1234567890
```

## Run the project 

Now run the skeleton project using the following commands. 

```
mvn install
mvn camel:run
```

The last 7 line of the output from second command above is shown below

```
 
```

That's it!!! for Lab 3. Congratulations on completing Lab 3. Now you can start the Lab 4.
