# 📊 Database Normalization Notes

## First Normal Form (1NF)
- Each table contains atomic values — no repeating groups or multi-valued attributes.
- Examples:
  - **Member (MemberID, FullName, Email, Mobile, Address, Suspended)**
  - **Student (MemberID, Course, MaxStudentLoans)**
  - **Staff (MemberID, Title, Department, MaxStaffLoans)**
  - **Loan (LoanID, MemberID, ItemID, StartDate, DueDate, ReturnDate, LoanStatus)**
  - **Reservation (ReservationID, MemberID, ItemID, ReservationStartDate, ReservationStatus, ReservationEndDate)**
  - **Loan_History (LHistoryID, LoanID, DateLogged)**
  - **Item (ItemID, ItemTitle, ItemType)**
  - **PhysicalBooks (ItemID, Author, ISBN, BookClass, Location, NumBooksAvailable, MaxBookLoan)**
  - **EBooks (ItemID, Author, ISBN, EBookClass, URL, NumEBooksAvailable, MaxEbookLoan)**
  - **Devices (ItemID, DeviceNum, DeviceType, DevicesAvailable, Location, MaxDeviceLoan)**

---

## Second Normal Form (2NF)
- All attributes are fully functionally dependent on the **whole** primary key (no partial dependencies).
- Actions Taken:
  - Split **Member** into **Member**, **Student**, and **Staff** entities.
  - Separated **Location** into its own entity to remove redundancy in **PhysicalBooks** and **Devices**.
  - Moved fine-related attributes from **Loan** to a new **Fines** entity.

---

## Third Normal Form (3NF)
- All attributes are non-transitively dependent on the primary key (no transitive dependencies).
- Actions Taken:
  - Removed **Suspended** from **Member** entity (calculated dynamically via fines).
  - Created **Fines (FineID, LoanID, StartFineDate, FineStatus)** as a separate table.
  - Ensured all entities are in 3NF with no derived or redundant attributes.

---

## Summary
By applying normalization up to **3NF** :
- Reduced data redundancy.
- Improved data integrity.
- Allowed for flexible and dynamic calculation of derived attributes (e.g., Suspended status).
- Ensured scalable database design for future extensions.

