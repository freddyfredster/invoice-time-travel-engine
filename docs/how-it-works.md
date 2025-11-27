# How the Time-Travel Engine Works

The Time-Travel Engine answers a simple question:

> “What did my invoices look like on this specific day?”

It does this by rebuilding the state of each invoice using three ingredients:

1. **Invoice data**
   - One row per invoice
   - Key fields:
     - `Invoice[InvoiceID]`
     - `Invoice[Total Amount]`
     - `Invoice[Invoice Date]`

2. **Payment data**
   - One row per payment
   - Linked to invoices by `InvoiceID`
   - Key fields:
     - `Payment[InvoiceID]`
     - `Payment[Amount]`
     - `Payment[Payment Date]`

3. **AsOf table**
   - A disconnected date table used only for snapshots
   - User picks a date from `AsOf[Date]`
   - The model treats that as “today” for all calculations

---

## Core Logic

For each invoice and each selected As-Of date, the engine calculates:

1. **Invoiced as of date**

Only includes invoices issued on or before the As-Of date.

2. **Paid as of date**

Only includes payments made on or before the As-Of date.

3. **Outstanding as of date**

`Outstanding = Invoiced as of date – Paid as of date`  
Clipped at zero so it never goes negative.

4. **Payment Status as of date**

Based on the outstanding and paid amounts:
- Fully Paid  → Outstanding = 0
- Unpaid      → Paid = 0 and Outstanding > 0
- Part Paid   → Paid > 0 and Outstanding > 0

All of this is calculated at query time using DAX measures.  
No snapshots, no stored history – the report rebuilds the past dynamically from the raw invoice and payment history.

---

## Row Visibility

To keep the view realistic, invoices that did not exist yet on the selected date can be hidden using a simple measure:

- Only show invoices where `Invoice Date <= As-Of date`.

This makes the report feel like a genuine “rewind” of your business at that moment in time.
