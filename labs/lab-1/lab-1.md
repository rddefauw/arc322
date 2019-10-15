# Lab 1: Create and run a skeleton Apache Camel Spring XML project

You will run this lab in the Cloud 9 IDE created for you.  You can find this by going to the Cloud 9 console and finding the environment named `IDE`.

## Setup

Run the following commands in a terminal window in your Cloud 9 IDE to update Java to version 1.8 and install maven and jq.

```
cd ~/environment/amazon-mq-workshop
./setup.sh
source ~/.bashrc
```

## What are we doing?

In order for you to build the example use case that was presented in the slide deck, you need some basic project structure and a set of tools. In this lab, you will learn how to start an integration project from scratch. 

## Create a skeleton project

Run the following command which creates a skeleton project for you.

```
mvn archetype:generate -DarchetypeGroupId=org.apache.camel.archetypes -DarchetypeArtifactId=camel-archetype-spring -DarchetypeVersion=2.24.2 -DgroupId=com.example -DartifactId=router
```
Just press enter for two prompts accepting default values.

## Run the skeleton project 

Now run the skeleton project using the following commands. You will be repeating the following two commands for testing our changes.

```
cd router
mvn install
mvn camel:run
```

The last 2 lines of the output from the second command above is shown below.

```
[1) thread #2 - file://src/data] route1                         INFO  Other message
[1) thread #2 - file://src/data] route1                         INFO  UK message
```

That's it for Lab 1. Now you can start Lab 2.
