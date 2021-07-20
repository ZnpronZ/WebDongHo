using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopBanDongHo.Models;
namespace ShopBanDongHo.Models
{
    public class Order
    {
        QuanLiDongHoEntities db = null;
        public Order()
        {
            db = new QuanLiDongHoEntities();
        }
        public long  Insert(HoaDon hoadon)
        {
            db.HoaDons.Add(hoadon);
            db.SaveChanges();
            return hoadon.MaHD;
        }
    }
}