# AWS Global Infrastructure

  AWS propose high availability and fault tolerance, building yours data centers in large groups, call regions, around the world. Inside the regions they have multiple data centers.

  The regions are connect by a high speed fiber network, and consists of two or more Availability Zones.

  The data's can be moved into regions, its just can be happen, if we explicitly grant permission to be moved. Any data in São Paulo region leaves the São Paulo region, unless you explicitly, with the right credentials and permissions, request the data be exported.

  There is four business factor that go into choosing a region:

  - `Compliance`: If you have a requirement your data must live in UK boundaries?  Then you should choose the London Region, full stop;
  - `Proximity`: How close you are to your customer base is a major factor because speed of light;
  - `Feature availability`: Sometimes the closet Region may not have all the AWS features you want;
  - `Pricing`: Even when the hardware is equal on Region to the next, some location are just more expensive to operate;

# Availability Zones

  An Availability Zone is a single data center or a group of data centers within a Region. This is close enough to have low latency between Availability Zones. However, if a disaster occurs in one part of the Region, they are distant enough to reduce the chance that multiple Availability Zones are affected.

![image](https://user-images.githubusercontent.com/13942355/128781197-7b083d1b-9f7c-47fa-bebd-de65804b154c.png)

# Amazon CloudFront and edge locations

  The concept of caching copies of data close to the customer al around the word is called by content delivery networks, or CDNs.

  On AWS, they call CND Amazon CloudFront. Amazon CloundFront is a service that helps deliver data, video, application and APIs to  customers around the world with low latency and high transfer speed.

  Edge locations is a site that Amazon CloundFront uses to store cached copies of your content closer to your customer, and are separate from Regions, so you can push content from inside a Region to a collection of Edge location around the world, in order to accelerate communication and content delivery.

# AWS Services

  In AWS everything is a API call, some example is:

  - `AWS Management Console`: is a browser-based, you can manager your AWS resources visually like Test environments, view AWS bills, monitoring and work with non-technical resources;
  - `AWS Command Line Interface (CLI)`: allows you to make API calls using the terminal on your machine. Writing commands using the CLI makes actions scriptable and repeatable, This makes it less  susceptible to human error;
  - `AWS Software Development Kits (SDKs)`: the SKDs allow you to interact with AWS resources through various programming languages;
  - `AWS Elastic Beanstalk`: you provide code and configuration settings, and Elastic Beanstalk deploys the resource necessary to perform the load balancing, adjust capacity, automatic scaling and application health monitor;
  - `AWS CloudFormation`: is a infrastructure as code tool, used to define a wide variety of AWS resources in a declarative way using JSON or YAML templates, and CloudFormation engine will worry about the details on calling APIs to get everything built out;
  - `AWS Outposts`: you can extend AWS infrastructure and services to your on-premises data center.
