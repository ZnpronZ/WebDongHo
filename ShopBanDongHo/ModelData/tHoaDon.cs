using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBanDongHo.ModelData
{
    public class tHoaDon
    {
        public int MaHD { get; set; }
        public string MaKH { get; set; }
        public string ShipName { get; set; }
        public string ShipMobile { get; set; }
        public string ShipAdress { get; set; }
        public DateTime NgayTao { get; set; }
        public string ShipEmail { get; set; }
        public int Status { get; set; }

    }
}