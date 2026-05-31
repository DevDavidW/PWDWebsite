# Pinewood Derby Website

Simple ASP.NET Web Forms site used to display Pinewood Derby race information and provide a way to register cars from a remote device (PC, laptop, tablet, etc.).

## Overview

- Hosts pages for registration, race status, and audience car status.
- Intended to run locally on the race computer with IIS Express.
- Can be shared to other devices on the same Wi-Fi network for audience viewing.

## Prerequisites

- Windows machine
- IIS Express installed
- Admin Command Prompt (required when binding to port 80)
- Optional: Local Wi-Fi network so other devices can view race pages

## Getting Started

1. Check out this repository to:
	 `C:\PinewoodDerby`
2. Obtain the Pinewood.mdb database and place into `C:\PinewoodDerby`
3. Open Command Prompt as Administrator.
4. From the project folder, run:
	 `RunIISExpress.cmd`

## Accessing the site remotely
The main idea here is to allow remote registration so the race computer is free to be setup at the race table and able to perform track testing, etc.

1. Ensure both computers are connected to a common Wifi (we use a dedicated WiFi router with a "Pinewood Track" SSID)
2. Ensure firewall is configured on race PC to accept port 80 traffic
	a. Press Win + R and run wf.msc
	b. Under Inbound rules, enable or add rule for TCP port 80
3. Run ipconfig on command line to determine IP
4. Access site pages listed below but using IP address (or machine name) of race computer

## Site Pages

- Remote car registration:
	http://localhost/Register.aspx
- Race status:
	http://localhost/Race.aspx
- Individual car status (default audience page):
	http://localhost/Cars.aspx

## Display Notes

- The race status page is useful on a secondary monitor for pit crew.
- It can also be projected or shown on another PC if devices are networked together.
- For audience access from phones or other devices, ensure the race computer is reachable on the same Wi-Fi network.