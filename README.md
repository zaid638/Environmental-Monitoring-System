# Environmental Monitoring System
<br />

Constructed an integrated environmental monitoring system in C, covering a range of fundamental concepts and practical applications. The project involves interacting with a free API that provides real-time environmental data. The system's core functionalities include data retrieval, processing, analysis, and reporting.
<br /><br />

## Data Retrieval
<br />

* Interacted with a free [API](https://api.openweathermap.org) to retrieve real-time environmental data (e.g., temperature, humidity).
<br />

## Data Processing and Analysis
<br />

* Processed the retrieved data using C programming concepts. 
* Implemented algorithms to analyze environmental data for anomalies or trends.
<br />

## Data Storage
<br />

* Stored both raw and processed environmental data in files.
<br />

## Reporting System
<br />

* Developed a reporting system that generates reports based on the analyzed environmental data.
<br />

## Automation and Integration
<br />

* Created shell scripts to automate tasks such as data retrieval, processing, and report generation.
<br />

* Integrated shell scripts with the C program to enhance automation.
<br />

## Optimization and Efficiency 
<br />

* Utilized pointers and dynamic memory allocation in the C program to optimize data manipulation and enhance efficiency.
<br />

## Real-time Alerts
<br />

* Implement real-time alerts using Linux system calls to notify relevant personnel of critical environmental readings.
<br />

# Use Case
<br />

* Run Fetch.sh in terminal using `bash ./Fetch.sh`
* Then your terminal will generate results in an interval of 1 hour
* if the temperature is greater than 30 °C  or less than 10 °C then it will send email to `muhammedhasanmisba@gmail.com`
<br />

## Program flow
<br />

* `Fetch.sh` --------> calls my_program(which is the executable for http_request.c) --------------> this generates weather_data.json file by fetching the api.
* `Fetch.sh` --------> calls `weather.zsh` ----------> this checks the conditions of temperture by reading the json file -----> if the condition is extreme then it generates a mail and sends to the above mentioned gmail.
* `Fetch.sh` --------> calls `generate_report.sh` ---------> this reads json file and writes the temperature condition on `report.txt` file.




