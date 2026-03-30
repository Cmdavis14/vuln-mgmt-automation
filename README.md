# Vulnerability Management Automation with PowerShell

## Overview
This project automates part of the vulnerability management process by taking exported scan results, identifying the highest-risk findings, and formatting them into a cleaner report for remediation follow-up.

The goal was to reduce the time spent manually reviewing raw vulnerability data and make it easier to focus on what needed immediate attention.

## Problem
Regular vulnerability scans were producing large amounts of data, and reviewing every finding manually was repetitive and time-consuming. A lot of effort was going into sorting, prioritizing, and preparing findings for ticket creation instead of moving directly into remediation.

## Solution
I built a PowerShell script that:

- Imports vulnerability scan results
- Filters findings based on CVSS score
- Prioritizes high and critical vulnerabilities
- Formats the data into a clean remediation-focused report
- Helps support faster ticket creation and follow-up actions

## Features
- Parses exported scan data from Tenable
- Filters vulnerabilities by severity and CVSS score
- Highlights high-priority findings
- Creates a structured output for remediation tracking
- Reduces manual review time

## Tech Used
- PowerShell
- Tenable scan exports
- CVSS-based prioritization
- CSV reporting

## Workflow
1. Export vulnerability scan results from Tenable
2. Run the PowerShell script against the exported file
3. Filter for high and critical findings
4. Generate a clean report for review and remediation
5. Use the report to support ticket creation and follow-ups

## Example Use Case
A typical scan could contain a large number of findings across multiple systems. Instead of manually reviewing every line, this script helps narrow the focus to the vulnerabilities that carry the most risk based on CVSS scoring.

This allows teams to spend more time fixing important issues and less time sorting through raw scan data.

## Sample Output
Example fields included in the report:

- Hostname
- IP Address
- Plugin / Vulnerability Name
- Severity
- CVSS Score
- Description
- Recommended Action

## Project Structure
```text
vuln-mgmt-automation/
├── README.md
├── scripts/
│   └── vuln_parser.ps1
├── sample-data/
│   └── sample_scan.csv
├── output/
│   └── prioritized_report.csv
└── docs/
    └── workflow-notes.md
