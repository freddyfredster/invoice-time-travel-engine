let
    Source =
        #table(
            type table
            [
                PaymentID   = Int64.Type,
                InvoiceID   = Int64.Type,
                Amount      = number,
                PaymentDate = date
            ],
            {
                // Invoice 1001 – fully paid in 2 instalments
                {1, 1001, 600.0, #date(2024,1,20)},
                {2, 1001, 600.0, #date(2024,2,10)},

                // Invoice 1002 – unpaid (no rows)

                // Invoice 1003 – part paid, 500 still outstanding
                {3, 1003, 500.0, #date(2024,3,15)},
                {4, 1003, 500.0, #date(2024,4,10)},

                // Invoice 1004 – fully paid same month
                {5, 1004, 2200.0, #date(2024,4,25)},

                // Invoice 1005 – fully paid but later
                {6, 1005, 950.0,  #date(2024,7,1)},

                // Invoice 1006 – part paid, 1000 outstanding
                {7, 1006, 750.0,  #date(2024,7,5)},

                // Invoice 1007 – unpaid

                // Invoice 1008 – fully paid in 2 instalments
                {8, 1008, 900.0,  #date(2024,8,20)},
                {9, 1008, 900.0,  #date(2024,9,15)},

                // Invoice 1009 – part paid, 1000 outstanding
                {10, 1009, 1000.0, #date(2024,10,15)},
                {11, 1009, 1000.0, #date(2024,11,15)},

                // Invoice 1010 – paid in full on the same day
                {12, 1010, 500.0, #date(2024,10,10)},

                // Invoice 1011 – paid over 3 instalments
                {13, 1011, 400.0, #date(2024,11,20)},
                {14, 1011, 400.0, #date(2024,12,20)},
                {15, 1011, 450.0, #date(2025,1,20)},

                // Invoice 1012 – unpaid

                // Invoice 1013 – paid in full next year
                {16, 1013, 980.0, #date(2025,1,5)},

                // Invoice 1014 – part paid, 650 outstanding
                {17, 1014, 650.0, #date(2025,2,1)},

                // Invoice 1015 – fully paid over 2 months
                {18, 1015, 2000.0, #date(2025,2,28)},
                {19, 1015, 2000.0, #date(2025,3,31)}
            }
        )
in
    Source