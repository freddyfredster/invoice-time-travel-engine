let
    Source =
        #table(
            type table
            [
                InvoiceID      = Int64.Type,
                MatterID       = Int64.Type,
                InvoiceStatus  = text,
                InvoiceNumber  = text,
                TotalAmount    = number,
                InvoiceDate    = date,
                DueDate        = date
            ],
            {
                // 2024 invoices
                {1001, 20001, "Issued",    "INV-1001", 1200.0, #date(2024,1,15),  #date(2024,2,14)},
                {1002, 20002, "Issued",    "INV-1002",  800.0, #date(2024,2,5),   #date(2024,3,6)},
                {1003, 20003, "Issued",    "INV-1003", 1500.0, #date(2024,3,1),   #date(2024,3,31)},
                {1004, 20004, "Issued",    "INV-1004", 2200.0, #date(2024,4,18),  #date(2024,5,18)},
                {1005, 20005, "Issued",    "INV-1005",  950.0, #date(2024,5,3),   #date(2024,6,2)},
                {1006, 20006, "Issued",    "INV-1006", 1750.0, #date(2024,6,20),  #date(2024,7,20)},
                {1007, 20007, "Issued",    "INV-1007",  600.0, #date(2024,7,5),   #date(2024,8,4)},
                {1008, 20008, "Issued",    "INV-1008", 1800.0, #date(2024,8,12),  #date(2024,9,11)},
                {1009, 20009, "Issued",    "INV-1009", 3000.0, #date(2024,9,30),  #date(2024,10,30)},
                {1010, 20010, "Issued",    "INV-1010",  500.0, #date(2024,10,10), #date(2024,11,9)},
                {1011, 20011, "Issued",    "INV-1011", 1250.0, #date(2024,11,2),  #date(2024,12,2)},
                {1012, 20012, "Issued",    "INV-1012", 2100.0, #date(2024,11,25), #date(2024,12,25)},
                {1013, 20013, "Issued",    "INV-1013",  980.0, #date(2024,12,5),  #date(2025,1,4)},

                // 2025 invoices
                {1014, 20014, "Issued",    "INV-1014", 1300.0, #date(2025,1,12),  #date(2025,2,11)},
                {1015, 20015, "Issued",    "INV-1015", 4000.0, #date(2025,1,30),  #date(2025,3,1)}
            }
        )
in
    Source