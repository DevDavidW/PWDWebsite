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
2. Open Command Prompt as Administrator.
3. From the project folder, run:
	 `RunIISExpress.cmd`

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