#/bin/bash!

1. What is Monitoring?
Monitoring is the continuous process of collecting, analyzing, and visualizing system and application metrics to understand the performance, availability, and overall health of your infrastructure.
2 . What is Prometheus?
Prometheus is a free and open-source tool used to monitor computers, servers, applications, and cloud systems. It helps you collect and store data about how your system is working, like CPU usage, memory, disk space, and more, and shows you that data in a way that’s easy to understand.
Prometheus is like a smart assistant that keeps checking how your systems are doing and tells you when something needs your attention.
We can explain like this also….
Prometheus is simply a monitoring tool for capturing and processing any number of time series. Collects, organizes, and stores, along with metrics, personal identifiers, and timestamps.
The Prometheus, open source software, “scrapes” HTTP endpoints to collect metrics from targets. Platforms for the infrastructures (such as Kubernetes), applications, and services are all supported “targets” (e.g. database management systems). Prometheus is a flexible metrics collection and alerting tool that works with its partner Alert Manager service.
Key Features of Prometheus
A multi-dimensional data model that uses metrics to display time series data.
The key/value pairs and name.
The simplest query language to use in this dimension is PromQL.
They do not rely on distributed storage; The individual server nodes are independent
The pull model over HTTP is used to collect time series.
A central table is used to push the timeline.
The objectives are met with static configuration or service discovery.
In Support of various graphing and dashboarding techniques.

How does Prometheus work?
1. Prometheus asks other tools (called exporters) for system data, like “Hey, what’s the CPU usage now?”
2. Exporters give the data (like CPU: 30%, Memory: 40%).
3. Prometheus stores this data with the time it was collected (this is called “time-series data”).
4. You can see or analyze this data using its web page or by connecting it to a tool like Grafana for beautiful dashboards
What is Node Exporter?
Node Exporter is a small tool used with Prometheus to collect hardware and system metrics from your Linux server.
It runs on each server (node) you want to monitor and provides important data like:
CPU usage
Memory usage
Disk space
Network traffic
System uptime
Prometheus then pulls this data from Node Exporter and stores it for analysis or alerting.
How Node Exporter Works?
You install Node Exporter on a Linux server.
1. It starts running and exposes data at: http://<server-ip>:9100/metrics
2. Prometheus accesses this URL to collect metrics regularly.
3. You can visualize the data in Grafana as graphs, gauges, and charts.
Install Prometheus on an EC2 Instance
1. Launch an Amazon Linux EC2 Instance

2. Execute the following commands to install Prometheus
- Copy all these lines and execute as one command
sudo tee /etc/yum.repos.d/prometheus.repo <<EOF

[Prometheus]

name=Prometheus

baseurl=https://packagecloud.io/prometheus-rpm/release/el/7/x86_64

repo_gpgcheck=1

enabled=1

gpgkey=https://packagecloud.io/prometheus-rpm/release/gpgkey https://raw.githubusercontent.com/lest/prometheus-rpm/master/RPM-GPG-KEY-prometheus-rpm

gpgcheck=1

metadata_expire=300

EOF

— — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — -

Then:
- sudo yum update -y

- sudo yum -y install prometheus2 node_exporter

- rpm -qi prometheus2

- sudo systemctl start prometheus node_exporter

sudo systemctl status prometheus.service node_exporter.service
3. Add port 9090 for Prometheus and port 9100 for Node Exporter in the security group

Copy ec2 public IP and paste it in the browser with port no 9090. Now you should see the Prometheus dashboard.

To see Node Exporter, copy ec2 public IP and paste it in the browser with port no 9100

How to Configure Prometheus?
After installing Prometheus, the most important step is configuring what to monitor — this is done in the prometheus.yml file.
Exporters like Node Exporter, Blackbox Exporter, etc., expose system or service metrics. You tell Prometheus where to find them using scrape_configs.
Example: Adding Node Exporter
1. Open the Prometheus config file:
sudo nano /etc/prometheus/prometheus.yml
2. Add the following lines to the scrape_configs section:
scrape_configs:
- job_name: ‘node_exporter’
static_configs:
- targets: [‘localhost:9100’]

job_name: A label to identify this exporter
targets: Where the exporter is running (IP:port)
3. Restart Prometheus
After editing the config file, restart Prometheus to apply changes:
sudo systemctl restart prometheus
4. Open your browser and go to: http://<your-server-ip>:9090
In the Prometheus dashboard, go to the “Targets” page to confirm that node_exporter is active.

Click on the “Graph” tab:

Type any metric starting with node_ (e.g., node_cpu_seconds_total)

Click “Execute.”

You’ll see live metric data


What is Alert Manager in Prometheus?
Alertmanager is a tool that works with Prometheus to manage and send alerts.
Prometheus detects problems, but Alertmanager is the one that sends notifications to you (via Email, Slack, Teams, etc.).
#Detailed setup of Alertmanager is out of scope for this document, but can be explored when implementing advanced alerting.
