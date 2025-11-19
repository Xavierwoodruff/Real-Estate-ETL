<h1>Connecticut Real Estate KPI Dashboard (SQL + Power BI)</h1>



<h2>Description</h2>

This project utilized PostgreSQL, Power BI, and raw real estate data to answer my key question: When is the best time to sell a house in Connecticut to maximize profit—both by time of year and specific days of the month?

I began by designing and building a PostgreSQL database to store and manage the dataset. Once the data was imported, I performed data cleaning by removing unnecessary columns, correcting inconsistencies, and preparing the dataset for analysis.

Next, I wrote a SQL query using a Common Table Expression (CTE) to aggregate and extract all relevant information needed for my analysis, and I created a view to streamline the connection to Power BI.

In Power BI, I connected to the view and developed an interactive dashboard with visualizations that allowed me to identify patterns and trends. This helped me determine the optimal periods for selling a home in Connecticut for maximum profitability.

Answer: Best time to sell your house for the most profit is in the summer months (months 6-8) usually in the middle of the month (days 15-18).

<br />


<h2>Languages and Utilities Used</h2>

- <b>PostgreSQL</b> 
- <b>Power-BI</b>

<h2>Environments Used </h2>

- <b>Windows 11</b> (24H2)

<h2>Program walk-through:</h2>

<p align="center">
Created Database: <br/>
<img src="https://imgur.com/TcwGJO4.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Transformed Data Using SQL: <br/>
<img src="https://imgur.com/40ZFi99.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Cleansed Raw Data:  <br/>
<img src="https://imgur.com/k4X8J1P.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Created Views:  <br/>
<img src="https://imgur.com/sMlFJgN.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Connected Database to Power BI:  <br/>
<img src="https://imgur.com/DJ2xBsF.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Completed Visuals:  <br/>
<img src="https://imgur.com/Q0rawCa.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
</p>

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
