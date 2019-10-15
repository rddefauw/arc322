# ARC322 - Enterprise Messaging Patterns 

## Overview

This is a reInvent 2019 Builder's session that provides a hands-on introduction to building enterprise integration patterns using Apache Camel using AmazonMQ.

All the labs together are developed to help participants gain knowledge in using Apache Camel in a structured appraach for their projects and help them to deploy the applications at scale.

## Introduction

Enterprises have been using messaging services as a backbone for integrating disparate systems and services. Most of these messaging systems are proprietary techonolgies, With the advent of open source software movement in the past decade or so, many open source messaging systems are gaining popularity. Most naotable are ActiveMQ and RabbitMQ.

In addition to messaging systems, there was also a need for software to integrate various applications that use messaging. Apache Camel was one of most popular and robust technology platform that offers seamless integration with different messaging systems, databases and different cloud services.

Application integration has been a challenge for many architects and developers. Architectural patterns such as [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/) are of great help in promoting consistency, manage technical dept and software reuse.

## Concepts

## Lab Guide

[AmazonMQ](https://aws.amazon.com/amazon-mq/) is an ActiveMQ based managed messaging service. For the builder session, you will use AmazonMQ to build your use case.

### Use Case

![Use Case](/images/ARC322-usecase.png)

The use case is an example that implements a content based router using Apache Camel and Amazon MQ. In this example, you were tasked to build a SaaS service for a stock brokerage firm. The service you are building takes stock orders in XML format in to each client's queue. If the orders contains a destination such as US or Canada, your router application copies the order messages to a destination queue. The detination queue essentially is a single service queue in your SaaS application. This queue pools orders from different clients and sends them to exchange. When the exchange fills the order, the trade messages would need to routed back to individual client's trade queues.

In the current session, you will be building the Router application. The labs 1 and 2 teaches you how to setup a skeleton application. Provides you a framework for building the use case.

### :white_check_mark: Prerequisites

The steps detailed here are only when you are exploring the labs in your own account. If you are running the labs as part of an event the prerequisites are optional. Please check with your event organizer.

Each lab builds on the previous lab. You are expected to run the labs in sequence and follow along the lab sequence to build a clear understanding of the concepts presented.

  1. Go to AWS console, open [Cloud9](https://us-east-1.console.aws.amazon.com/cloud9/home?region=us-east-1) service console.
  2. Open IDE that contains name "ARC322"
  3. Run the following commands in the bash command line.
 
``` bash
cd ~/environment/arc322
./setup.sh
source ~/.bashrc
```

### Labs

* **[Lab 1: Create and run a skeleton Apache Camel java project](/labs/lab-1/lab-1.md)** - In this Lab we will explore how to start a new Camel Java project and run it. 
* **[Lab 2: Integrate Broker endpoints and test](/labs/lab-2/lab-2.md)** - In this Lab we will explore how to add broker endpoints, send/receive messages to get familiar with Java DSL.
* **[Lab 3: Implement our sample use case](/labs/lab-3/lab-3.md)** - First two labs covered the fundamental pieces of knowledge we need. Lets dive in and implement the use case.



