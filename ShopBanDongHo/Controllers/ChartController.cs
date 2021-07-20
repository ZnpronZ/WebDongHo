using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ShopBanDongHo.Models;
using ShopBanDongHo.ModelData;

namespace ShopBanDongHo.Controllers
{

    public class ChartController : ApiController
    {
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        public IEnumerable<tDoanhThu> GetallDoangThu()
        {
            IList<tDoanhThu> tongdoanhthu = new List<tDoanhThu>();

            var sell = db.DoanhThus
                 .GroupBy(a => a.TenNhanVien)
    .Select(a => new { Amount = a.Sum(b => b.DoanhThuNV), Name = a.Key })
    .OrderByDescending(a => a.Amount)
    .ToList();

            foreach (var item in sell)
            {
                tongdoanhthu.Add(new tDoanhThu
                {
                    tennhanvien = item.Name,
                    tongdoanhthu = (int)item.Amount

                });
            }

            return tongdoanhthu;
        }

    }
}
