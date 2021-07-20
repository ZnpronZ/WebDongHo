using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopBanDongHo.Models;
namespace ShopBanDongHo.Models
{
    public class orderdetail
    {
        QuanLiDongHoEntities db = null;
        public orderdetail()
        {
            db = new QuanLiDongHoEntities();
        }
        public bool Insert(ChiTietHoaDon chitiet)
        {
            try
            {
                db.ChiTietHoaDons.Add(chitiet);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}