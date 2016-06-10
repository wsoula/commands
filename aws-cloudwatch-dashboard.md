Implementing a Custom AWS CloudWatch Dashboard - http://www.taos.com/2014/04/09/implementing-a-custom-aws-cloudwatch-dashboard/

by Ross Oliver, Senior Technical Consultant at Taos

CloudWatch is an Amazon Web Services (AWS) service that automatically collects a wide range of performance and health data about your AWS resources.  This data is available through an API, and also can be viewed as graphs on the AWS console.  However the graphs are located on the separate console pages for each type of resource (e.g. EC2, RDS, load balancer, etc).  The dispersed locations make it impossible to have a single dashboard view of multiple AWS resources.  To address this gap, I created a single web page that uses the Amazon CloudWatch API to collect data from any number of AWS resources and display in a consolidated dashboard like this:

Ross Oliver Blog Image

The dashboard is data-driven, so additions and changes are a simple matter of adding to or modifying the JavaScript data structure to define new graphs.  Auto-refresh is also included, making the dashboard suitable for a Operations Center style wall display.  This article provides the step-by-step procedure for implementing your own custom AWS dashboard.

Since the dashboard is a web page, a web server will be needed.  A micro AWS EC2 instance is usually sufficient.  The procedure described here is intended for readers with minimal scripting and web server configuration experience, therefore makes some choices a more experienced Sysadmin might do differently.  Feel free to adapt to your own environment and tastes.

To build your own dashboard, start by creating an EC2 micro instance using the Amazon Linux image.


Install the web server software:

`sudo yum install httpd24`
Python and boto are also required; these are already installed as part of the Amazon image.

Install the Python pytz timezone library:

`sudo yum install pytz`
Install Google Visualization Python library:
```
wget http://google-visualization-python.googlecode.com/files/gviz_api_py-1.8.2.tar.gz
tar xzf gviz_api_py-1.8.2.tar.gz
sudo ./setup.py install
```
Download Cloudviz and copy files to the web server document root:
```
wget https://github.com/mbabineau/cloudviz/archive/master.zip
unzip master.zip
cp master/cloudviz.py master/settings.py /var/www/html
```
Cloudviz is written to use the simplejson functionality of Django.   However you can avoid the overhead of installing Django by altering two lines in cloudviz.py:

Change from:

`from django.utils import simplejson`
Change to:

`import json`
Change from:

`cloudviz_query = simplejson.loads(fs.getvalue('qs'))`
Change to:

`cloudviz_query = json.loads(fs.getvalue('qs'))`
For the next step, you will need your AWS access key.  For information about how to obtain and use access keys, see http://docs.aws.amazon.com/general/latest/gr/getting-aws-sec-creds.html

The Cloudviz script needs your AWS access key to retrieve the desired data from the AWS CloudWatch API.  The Cloudviz README recommends setting your access key in the settings.py file:
```
# Uncomment and set to your Amazon credentials:
AWS_ACCESS_KEY_ID = "GBSE5GD3HLCVAQ4Y7KN"
AWS_SECRET_ACCESS_KEY = "X6rIZEv/6htGbsevItNsegxRxRsWjhFcCudL3tF4"
```
However the settings.py file needs to be in the same directory as cloudviz.py, and therefore could potentially become Internet accessible.  I prefer installing keys in the /etc/boto.cfg file:
```
[Credentials]
aws_access_key_id = GBSE5GD3HLCVAQ4Y7KN
aws_secret_access_key = X6rIZEv/6htGbsevItNsegxRxRsWjhFcCudL3tF4
```
Notice the absence of quotes around the values.  Storing credentials there is also useful if you plan to use the boto library for functions in addition to cloudviz.  If you choose the /etc/boto.cfg method, you will still need to uncomment the variables in settings.py, but set them to null values:
```
# Uncomment and set to your Amazon credentials:
AWS_ACCESS_KEY_ID = ""
AWS_SECRET_ACCESS_KEY = ""
```
Modify the Apache httpd config to execute Python scripts:
```
Add "ExecCGI" to "Options" for the directory where the scripts reside.
Add "AddHandler cgi-script .py"
Restart httpd
```
Download the dashboard file aws-dashboard.html:
```
wget https://s3-us-west-2.amazonaws.com/roliver-dashboard/aws-dashboard.html
cp aws-dashboard.html /var/www/html
```
Make the necessary changes to aws-dashboard.html to match your AWS environment and resources:

Change this line to match your AWS region:

`var region = "us-west-2";`
Change this line to match your path to cloudviz.py:

`var cloudvizPath = '/cloudviz.py';`
Change the “dimensions” values to match your AWS instances, e.g.:
```
{
"prefix": "Web 2 CPU ",
"dimensions": { "InstanceId": "i-96afde5f"}
},
```
The “dimension” for EC2 instances are their instance IDs, for load balancers and database instances, their instance identifier names.

To add a new graph to the dashboard:

Add a new HTML <div> element to the page and give it an ID name
Copy an existing  top-level structure in the “chart” array to create a new array element
Change the “container” value to match the ID of your new <div> element
Change the values for “namespace”, “metric”, “statistics”, “dimension”, and “prefix” to select the desired CloudWatch data for the new graph
To view a list of all available metric names, go to the AWS CloudWatch console, and click on “Browse Metrics”

Amazon will no doubt address the shortcomings of CloudWatch graphs eventually, but until then, a bit of Python and JavaScript can be a big help in providing a consolidated view of your various AWS resources.  So go forth and monitor!
