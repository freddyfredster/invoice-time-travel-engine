# Formula Library (DAX)

This page lists all DAX measures used in the Time-Travel Engine, grouped by purpose.  
Each measure calculates values *as of* the date selected in the `AsOf` table.

---

## 📅 As-Of Date

### **As Of Date**
Returns the selected date from the AsOf table (or the latest AsOf date if nothing is selected).


As Of Date =
VAR d = SELECTEDVALUE ( AsOf[Date] )
RETURN
IF ( NOT ISBLANK ( d ), d, MAX ( AsOf[Date] ) )

💰 Per-Invoice Measures
These measures rebuild the financial state of each invoice at the selected date.

Invoiced £ (As Of, per Invoice)
Amount invoiced on or before the As-Of date.

Invoiced £ (As Of, per Invoice) =
VAR AsOfDate = [As Of Date]
RETURN
CALCULATE (
    SUM ( 'Invoice'[Total Amount] ),
    'Invoice'[Invoice Date] <= AsOfDate
)

Paid £ (As Of, per Invoice)

Payments made on or before the As-Of date.

Paid £ (As Of, per Invoice) :=
VAR AsOfDate = [As Of Date]
RETURN
CALCULATE (
    SUM ( 'Payment'[Amount] ),
    'Payment'[Payment Date] <= AsOfDate
)

Outstanding £ (As Of, per Invoice)
Invoiced minus paid (never below zero).

Outstanding £ (As Of, per Invoice) =
VAR Invoiced = [Invoiced £ (As Of, per Invoice)]
VAR Paid     = [Paid £ (As Of, per Invoice)]
RETURN
MAX ( 0, Invoiced - Paid )

🏷️ Payment Status
Categorises each invoice at the selected point in time.

Payment Status (As Of) :=
VAR Out  = [Outstanding £ (As Of, per Invoice)]
VAR Paid = [Paid £ (As Of, per Invoice)]
RETURN
SWITCH (
    TRUE (),
    Out = 0,                 "Fully Paid",
    Paid = 0 && Out > 0,     "Unpaid",
    Paid > 0 && Out > 0,     "Part Paid",
    BLANK ()
)


📊 Aggregated Measures
These work over a list of invoices (matter, client, totals, etc.).

Total Invoiced £ (As Of) :=
SUMX (
    VALUES ( 'Invoice'[InvoiceID] ),
    [Invoiced £ (As Of, per Invoice)]
)

Total Paid £ (As Of) :=
SUMX (
    VALUES ( 'Invoice'[InvoiceID] ),
    [Paid £ (As Of, per Invoice)]
)

Total Outstanding £ (As Of) :=
SUMX (
    VALUES ( 'Invoice'[InvoiceID] ),
    [Outstanding £ (As Of, per Invoice)]
)

👀 Row Visibility
Show Invoice Row (As Of)
Hides invoices created after the selected As-Of date.

Show Invoice Row (As Of) =
VAR AsOfDate = [As Of Date]
VAR InvDate  = SELECTEDVALUE ( 'Invoice'[Invoice Date] )
RETURN
IF ( NOT ISBLANK ( InvDate ) && InvDate <= AsOfDate, 1, 0 )
Use this as a visual filter:
Show Invoice Row (As Of) = 1

All measures are also available individually in the /dax folder.