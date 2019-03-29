![draft diagram](https://raw.githubusercontent.com/WeaverHeavy/CTIA/master/Draft%20Diagram.png)
# Cyber Threat Intelligence Appliance (CTIA)

**note: this is currently under development**

GOALS:

- Create a free, expandable, open-source, easily/rapidly deployable, Intelligence appliance for CSIRTs, CERTs, SOCs, etc.

- Utilize docker containers or a private cloud setup that includes instances of well documented/supported cyber threat intelligence tools


# Candidate tools:


- FAME: Malware sandbox extension to cuckoo

- MISP: Intelligence collection/aggregation/enrichment tool

- Cuckoo: Malware sandbox

- Cortex: Indicator Enrichment

- YETI: threat feed/IOC aggregator, some link analysis, and YARA capability (I may skip this one)

- STIX/TAXII: threat feeds and IOC sharing

- FreeNAS: shared storage for VMs and Collaboration

- Mattermost: For team communication

- Ejabberd: Maltego Collaboration

- MySQL: MISP database

- Maltego Transform server: For hosting custom Maltego Transforms locally

- OpenVPN: OPSEC

- ELK stack: (optional) if your team doesn't already use this

- portainer: Container management/orchestration

- Possibly some kali and some forensics boxes with vnc, but we'll see.
