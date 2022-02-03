# Consume Prometheus Metrics from Oracle Web Logic


1.Create `.env` file for the Otel Connector Gateway
```bash
echo SPLUNK_ACCESS_TOKEN=<your o11y access token> > .env
echo SPLUNK_REALM=<your o11y realm> > .env
echo SPLUNK_MEMORY_TOTAL_MIB=1024 > .env
```
2.(optional)
This step is only needed if you need to update the WLS Exporter.  You won't need to unless something changes drastically. 
To generate the latest `wls-exporter.war` WAR (Web Archive) file. The WAR file is required for this work properly
```bash
cd weblogic/exporter
get2.0.sh exporter-config.yaml
cp wls-exporter.war ../admin/apps
```
3.Fire up the containers
``` bash
docker compose up -d
```
4. Install The Apps
Screenshots of this process coming soon.

3. To Deploy the WAR File to the Production Server
Open the WebLogic Server console for the target server running in production mode at `http://localhost:7001/console`. Use the credentials conatined in the `./weblogic/admin/security.properties` file.

* On the left-hand side Change Center pane, click Lock & Edit.
* On the left-hand side Domain Structure pane, click Deployments.
* On the right-hand content pane, click Install.
* Browse to the directory where the WAR (`localhost/app`) file resides, mark the radio button next to the WAR file you want to deploy, and click Next.
* Confirm that the radio button next to Install this deployment as an application is marked and click Next.
* Click Finish.
* On the left-hand side Change Center pane, click Activate Changes.
* On the right-hand content pane, mark the radio button next to the EAR just deployed.
* Click Start to view the dropdown list and select Servicing all requests.
* In the content pane of the new page, click Yes.
