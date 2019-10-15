# Lab 2: Integrate Amazon MQ 

## Prerequisites

You must have completed Lab 1 successfully. Each lab builds on the previous lab. 

Switch to the `router` directory in your Cloud 9 IDE.

```
cd ~/environment/amazon-mq-workshop/router
```

## What are we doing?

In this lab, we will be integrating Amazon MQ queues to our skeleton project. First we will add necessary dependencies to our project and then we will configure a route that just copies messages from one queue to another.

## Add dependencies

Our project depends on various java libraries to run. These dependencies are managed by Maven. Add the following lines to ```pom.xml`` file in the ```<dependencies>``` block.

```
    <dependency>
        <groupId>org.apache.activemq</groupId>
        <artifactId>activemq-camel</artifactId>
        <version>5.15.9</version>
    </dependency>
    <dependency>
        <groupId>org.apache.activemq</groupId>
        <artifactId>activemq-all</artifactId>
        <version>5.15.9</version>
    </dependency> 
    <dependency>
        <groupId>org.apache.camel</groupId>
        <artifactId>camel-jasypt</artifactId>
        <version>2.24.2</version>
    </dependency>    
```

## Add ActiveMQ bean

Add the following lines to ```router/src/main/resources/META-INF/spring/camel-context.xml``` under ```<beans>``` 

```
        <!-- define the activemq component -->
        <bean id="activemq" class="org.apache.activemq.camel.component.ActiveMQComponent">
        <property name="connectionFactory">
          <bean class="org.apache.activemq.ActiveMQConnectionFactory">
            <property name="brokerURL" value="${broker.brokerURL}"/>
            <property name="userName" value="${broker.username}"/>
            <property name="password" value="${broker.password}"/>
          </bean>
        </property>
        </bean>
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

## Add a new route that uses the bean above

Add the following lines to ```router/src/main/resources/META-INF/spring/camel-context.xml``` under ```<camelContext>``` 

```
    <route>
      <from uri="activemq:queue:CAMEL.1"/>
      <to uri="activemq:queue:CAMEL.2"/>
    </route>
```

## Run the project 

Now run the skeleton project using the following commands. 

```
mvn install
mvn camel:run
```

The last 7 line of the output from second command above is shown below

```
 INFO | Successfully connected to ssl://b-590425c9-1a73-43b0-ac7b-03bb58ecd8c1-1.mq.us-east-1.amazonaws.com:61617
 INFO | Route: route1 started and consuming from: activemq://queue:CAMEL.1
 INFO | Route: route2 started and consuming from: file://src/data?noop=true
 INFO | Total 2 routes, of which 2 are started
 INFO | Apache Camel 2.24.2 (CamelContext: camel-1) started in 1.243 seconds
 INFO | Other message
 INFO | UK message
```

That's it for Lab 2. Now you can start Lab 3.
