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
Screenshots of this process coming soon.  If you need to know how right now, reach out to tjohander@splunk.com or review the Web Logic documentation for "Deployments".
