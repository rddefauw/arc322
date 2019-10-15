# ARC322 - Enterprise Messaging Patterns 

## Overview

This is a reInvent 2019 Builder's session that provides a hands-on introduction to building enterprise integration patterns using Apache Camel and Amazon MQ.

The labs help participants gain knowledge in using Apache Camel in a structured appraach for their projects and in deploying the applications at scale.

## Introduction

Enterprises use messaging services as a backbone for integrating disparate systems and services. Most of these messaging systems are proprietary techonolgies, but many open source messaging systems are gaining popularity. The most notable open source messaging systems are ActiveMQ and RabbitMQ.

In addition to messaging systems, there is also a need for software to integrate various applications that use messaging. Apache Camel is one of the most popular and robust technology platform that offers seamless integration with different messaging systems, databases, and cloud services.

Application integration has been a challenge for many architects and developers. Architectural patterns such as [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/) are of great help in promoting consistency, managing technical dept, and increasing software reuse.

## Concepts

[Amazon MQ](https://aws.amazon.com/amazon-mq/) is an ActiveMQ-based managed messaging service. For the builder session, you will use Amazon MQ to build your use case.

### Use Case

![Use Case](/images/ARC322-usecase.png)

The use case implements a content based router using Apache Camel and Amazon MQ. In this example, you are tasked to build a SaaS service for a stock brokerage firm. The service you are building takes stock orders in XML format into each client's queue. If the orders contains a destination such as US or Canada, your router application copies the order messages to a destination queue. The detination queue essentially is a single service queue in your SaaS application. This queue pools orders from different clients and sends them to an exchange. When the exchange fills the order, the trade messages would need to route back to an individual client's trade queues.

In the current session, you will be building the Router application. Labs 1 and 2 teach you how to set up a skeleton application, and Lab 3 provides you a framework for building the use case.

## Lab Guide

### :white_check_mark: Prerequisites

The steps detailed here are only when you are exploring the labs in your own account. If you are running the labs as part of an event the prerequisites are optional. Please check with your event organizer.

* Go to the AWS console and go to CloudFormation.
* Create a new stack using the template provided in `cloudformation/arc322.yaml`.
    * You can give the stack any name you like.
    * Set the `Lab Configuration` to `user`.
    * Leave other options at default values.

### Labs

Each lab builds on the previous lab. You are expected to run the labs in sequence.

* **[Lab 1: Create and run a skeleton Apache Camel java project](/labs/lab-1/lab-1.md)** - In this Lab we will explore how to start a new Camel Java project and run it. 
* **[Lab 2: Integrate Broker endpoints and test](/labs/lab-2/lab-2.md)** - In this Lab we will explore how to add broker endpoints and send/receive messages to get familiar with the Java DSL.
* **[Lab 3: Implement our sample use case](/labs/lab-3/lab-3.md)** - The first two labs covered the fundamental pieces of knowledge we need. Let's dive in and implement the use case.



