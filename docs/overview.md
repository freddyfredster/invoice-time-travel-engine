# Time-Travel Engine – Overview

The Time-Travel Engine lets you see your invoices exactly as they looked on any past date.

Instead of only showing what is unpaid today, it rebuilds the state of each invoice at a chosen point in time:

- What was still unpaid?
- What had been partially paid?
- What was fully paid?
- What was the true outstanding balance on that day?

It does this by combining:
- an **AsOf** date table (a disconnected calendar just for snapshots)
- invoice data (issue date and total amount)
- payment data (payment dates and amounts)
- a set of DAX measures that recalculate paid, outstanding, and status *as of* the selected date.

Use this model as a template to plug in your own invoice and payment tables and get instant “time-travel” reporting in Power BI.
