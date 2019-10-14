# ARC322 - Enterprise Messaging Patterns 

## Overview

This is a reInvent 2019 Builder's session that provides a hands-on introduction to building enterprise integration patterns using Apache Camel using AmazonMQ.

The Lab guide is divided into 3 modules, a **Basic** module, an **Advanced** Module and a **Bonus** module. Each module consists of a set of hands on exercises. For the reInvent session, given it's limited time, participants are expected to implement a simple use case. 

If time permits, participants are encouraged to explore the rest of the modules if they can within the stipulated time or later in their own accounts. 

All the modules together are developed to help participants gain knowledge in using Apache Camel in a structured appraach for their projects and help them to deploy the applications at scale.

## Lab Guide

### Example Use Case

### :white_check_mark: Prerequisites

The steps detailed here are only when you are exploring the labs in your own account. If you are running the labs as part of an event the prerequisites are optional. Please check with your event organizer.

Each lab builds on the previous lab. You are expected to run the labs in sequence and follow along the lab sequence to build a clear understanding of the concepts presented.

  1. Go to AWS console, open "Amazon MQ" service console.
  2. In the Amazon MQ console, click on "Brokers" to see the brokers setup as a result of running CloudFormation script.
  3. Click on the {Stackname}-Broker to view the Broker details, find the panel named "Endpoints"
  4. For the "Openwire" endpoint, click on "Copy failover string" link which copies a link to clipboard.
  5. Run the following commands one by one. In the first line below, paste the copied string.
 
``` bash
cd ~/environment/arc322
./setup.sh
source ~/.bashrc
```

### Basic

* **[Lab 1: Create and run a skeleton Apache Camel java project](/labs/lab-1.md)** - In this Lab we will explore how to start a new Camel Java project and run it. 
* **[Lab 2: Integrate Broker endpoints and test](/labs/lab-2.md)** - In this Lab we will explore how to add broker endpoints, send/receive messages to get familiar with Java DSL.
* **[Lab 3: Implement our sample use case](/labs/lab-3.md)** - First two labs covered the fundamental pieces of knowledge we need. Lets dive in and implement the use case.

### Advanced

### Bonus



