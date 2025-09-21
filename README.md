# Salesforce Currency Converter

A Salesforce project that integrates with an external Currency Exchange API to automatically update Opportunity amounts in multiple currencies (USD, EUR, GBP).

## 🚀 Features
- **API Integration**: Uses a custom metadata setting to store the API endpoint (`https://open.er-api.com/v6/latest/`).
- **Real-Time Updates**: Trigger runs after Opportunity insert to calculate currency equivalents.
- **Batch + Scheduler**: Mass updates existing Opportunities daily using a scheduled batch job.
- **Custom Fields**: Stores converted amounts in custom fields (`EUR__c`, `GBP__c`, `USD__c`).
- **Custom Metadata**: Easy to configure API endpoint without code changes.

## 🛠️ Tech Stack
- **Apex** (HTTP Callouts, Batch, Scheduler, Triggers)
- **Custom Metadata Types**
- **Formula Fields**
- **Salesforce Platform**

## 📂 Key Components
- `ExchangeRateCallout.cls`: Handles the HTTP callout and response parsing.
- `ExchangeRateCalculator.cls`: Applies conversion logic on Opportunity records.
- `OpportunityTrigger.trigger`: Fires after insert to calculate conversions.
- `MassOpportunityUpdater.cls`: Batch job to update all Opportunities with latest rates.
- `MassOpportunityScheduler.cls`: Schedule to run batch job daily.
- `ExchangeRate__mdt`: Custom metadata storing API endpoint.

## ⚡ Example Use Case
1. User creates a new Opportunity with an `Amount` in NGN.
2. Trigger calls the API and calculates equivalent amounts in USD, GBP, and EUR.
3. Results are stored in `USD__c`, `GBP__c`, and `EUR__c` fields.
4. Batch job ensures all Opportunities stay up-to-date with current rates.

## 📈 Impact
- Eliminates manual currency conversion for sales reps.
- Keeps Opportunities consistent across multiple currencies.
- Demonstrates scalable Apex best practices (Callouts, Batch, Scheduler, Custom Metadata).

---

### 🔗 API Used
[Open Exchange Rates API](https://open.er-api.com/)

---

### 👨‍💻 Author
Oluwafemi Sopade – Salesforce Developer
<img width="468" height="645" alt="image" src="https://github.com/user-attachments/assets/24f3db5c-913e-4dfd-a4f8-d3a420a14d39" />

