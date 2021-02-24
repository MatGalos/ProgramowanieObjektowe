using System;
using System.Collections.Generic;
using System.Text;

namespace DobraNutkaLibrary
{
    public class Order
    {
        public int OrderID { get; set; }
        public int ClientID { get; set; }
        public int AlbumID { get; set; }
        public int EmployeeID { get; set; }
        public int LocationID { get; set; }
    }
}
