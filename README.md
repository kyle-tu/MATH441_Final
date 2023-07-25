# MATH 441 Project Introduction
For every company, it is essential to store files on a large scale. Some files are important to be able to always retrieve, whereas other files are less crucial. The company might have some files which are used multiple times a day for a period, whereas other files are only opened very seldom, but they might still be important to keep for many years. As companies expand more people need to retrieve the companies' files, both in the same office, but also across different offices, cities, and even countries. 
More and more companies, therefore, decide to use cloud solutions for storing their files. This solution comes with many benefits, but it can also be rather expensive, or inefficient if the company does not choose the right way of storing its files in the cloud. A possible cloud-storing solution is the Amazon AWS S3 service. S3, which stands for Simple Storage Service, has multiple tiers. The tiers have different specifications for how often the data is accessed, how fast the data can be accessed, how many availability zones each tier offers, and much more. 
As the storage grows from Gigabytes to Terabytes and Petabytes, the costs of storage will grow to millions. Thus when taking egress and retrieval into consideration, means that the costs a company spends on storage only keep growing. To account for this, it is common for companies to try to utilize different storage buckets to their needs. For example, some storage buckets offer cheap egress and retrievals, whereas others offer cheaper long-term storage.

## Amazon AWS S3
As mentioned Amazon AWS S3 is a cloud-storing solution, where companies can pay to have their data stored in the cloud. The service has different tiers, meaning different storage possibilities. Each tier then has some probabilities, which makes it good for storing specific types of data.

In this project, we look at six tiers. The first tier, called *Tier 1* in the report is for data that is frequently accessed. This tier has a high storage cost, but a low retrieval cost. The retrieval time and the minimum storage duration are also low for this tier. 

The other tiers have lower storage costs, but higher values in the other properties. In this report, we will mostly look at *Retrieval Time*, *Minimum Storage Duration*, *Storage Cost*, and *Retrieval Charge*, but there are many more properties for these tiers which could be taking into consideration.

Amazon AWS S3 also has different storage possibilities in different regions and there is a cost of moving files from one region to another.


## Problem description
There are multiple ways to optimize the storage to minimize certain fields. In this project, we will use linear programming and mixed integer programming to optimize the cost of storage in S3 depending on a company's requirements about how much data they want to store and how often they want to retrieve the specific data.

We will first start with a very simple problem linear problem, where we just look at a few properties of the tiers. Afterward, we will extend the problem to a binary problem to make it more realistic and usable for companies. Hereafter we will try to formulate the problem from Amazon's point of view, as they also wish to decrease the cost of running the cloud servers, to both maximize their profit, as well as keeping their prices low. Furthermore, we will look into storing in different regions, and how a company can cheapest move and store their data in different regions.

The report also discusses the possibilities and limitations of the different models implemented in the project, and how they can be improved.

