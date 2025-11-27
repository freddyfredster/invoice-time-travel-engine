# Power BI Time-Travel Engine  
Recreate your business exactly as it looked on any past date.

Most reporting tools only show what your numbers look like *today*.  
This engine rewinds your data so you can see:

- how much was unpaid on a specific day  
- which invoices were part-paid or fully paid at that time  
- your true outstanding balance for any historical date  

Perfect for service-based businesses (legal, consulting, accounting, agencies, insurance, contractors, etc.) where payments often arrive after the work is done.

---

## 🚀 What This Project Does

This Power BI model rebuilds the financial state of every invoice **as of any date you choose**.  
Unlike a normal date filter, this engine uses invoice + payment history to recreate the past:

- ✔️ Outstanding amounts *as they were on that day*  
- ✔️ Paid totals up to that day  
- ✔️ Accurate invoice status (Unpaid / Part Paid / Fully Paid)  
- ✔️ Optional filtering of invoices that didn’t exist yet  
- ✔️ Works for any business that sends invoices and receives payments  

Think of it as a dynamic **as-of ledger** that rewinds your business on demand.

---

## 🎥 Demo Report
👉 *Add your link here*

## 💾 Download the PBIX  
👉 *Add link or include PBIX inside the `/pbix` folder*

---

## 📂 Repository Structure  

```
invoice-time-travel-engine/
│
├── README.md
├── LICENSE
│
├── /pbix/
│   ├── TimeTravelEngine_Demo.pbix
│   └── SampleData.xlsx
│
├── /docs/
│   ├── overview.md
│   ├── how-it-works.md
│   ├── formula-library.md
│   └── business-use-cases.md
│
├── /dax/
│   ├── AsOfDate.dax
│   ├── InvoicedPerInvoice_AsOf.dax
│   ├── PaidPerInvoice_AsOf.dax
│   ├── OutstandingPerInvoice_AsOf.dax
│   ├── PaymentStatus_AsOf.dax
│   ├── TotalInvoiced_AsOf.dax
│   ├── TotalPaid_AsOf.dax
│   ├── TotalOutstanding_AsOf.dax
│   └── ShowInvoiceRow_AsOf.dax
│
├── /powerquery/
│   └── invoice-data-generation.m
│   └── payment-data-generation.m
│
├── /images/
│   ├── report-homepage.png
│
└── /scripts/
    └── export-measures.ps1

```
---

The core DAX logic is stored in the `/dax` folder, including:

- `AsOfTable.dax` – creates the AsOf snapshot date table
- Measures for invoiced, paid, outstanding, payment status, totals, and row visibility.

---

## 🧠 How the Time-Travel Logic Works

### 1️⃣ Disconnected “As-Of Date”  
A separate table controls the snapshot date without interfering with your normal Date table.

### 2️⃣ As-Of Measures  
Custom DAX measures calculate for each invoice:

- invoiced amount as of the selected date  
- paid amount as of that date  
- outstanding balance  
- correct status (unpaid, part-paid, fully paid)  

Only transactions **up to that date** are considered.

### 3️⃣ Dynamic Row Visibility  
Invoices raised after the selected date can be automatically hidden, giving a true historical view.

---

## 📚 Documentation

- [Overview](docs/overview.md)
- [How it Works](docs/how-it-works.md)
- [Formula Library (DAX)](docs/formula-library.md)
- [Business Use Cases](docs/business-use-cases.md)

---

## 📊 Screenshots  
 
![Time-Travel UI](./images/time-travel-demo.png)

---

## 💡 Who This Helps

Any business that issues invoices and receives payments later — including:

- law firms  
- accountants  
- consultants  
- agencies  
- contractors  
- insurance brokers  
- professional services  

If you’ve ever needed to answer *“What did our numbers look like back then?”*, this solves it instantly.

---

## 🔧 Requirements

- Power BI Desktop (latest version)  
- Basic understanding of DAX  
- Standard invoice & payment tables  

---

## 📥 How to Use

1. Open the PBIX in `/pbix`.  
2. Review the DAX measures in `/dax`.  
3. Replace sample tables with your own.  
4. Connect your Invoice and Payment tables.  
5. Adjust date fields in the As-Of logic if needed.  
6. Refresh and explore past dates.  

---

## 🤝 Contributing  
Pull requests welcome.  
Open issues for suggestions or improvements.

---

## 📄 License  
MIT License — free for personal and commercial use.

---

## ⭐ Support  
If this helps you, please **star the repo**.  
It shows that these open-source analytics tools bring value to the community.
