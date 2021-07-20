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
    public class CompanyController : ApiController
    {
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        //http get company
        public IEnumerable<tCongTy> GetAllCongty()
        {

            IList<tCongTy> ct = new List<tCongTy>();
            var dsCT = from a in db.CongTies select a;
            foreach (var item in dsCT)
            {
                ct.Add(new tCongTy
                {
                    TenCty = item.TenCty,
                    DiaChi = item.DiaChiCty,
                    SoDT = item.SdtCty,

                });
            }


            return ct;
        }
        public IEnumerable<tCongTy> GetCongtyByName(string id)
        {

            IList<tCongTy> ct = new List<tCongTy>();
            var dsCT = db.CongTies.Where(n => n.TenCty.Contains(id)).ToList();
            foreach (var item in dsCT)
            {
                ct.Add(new tCongTy
                {
                    TenCty = item.TenCty,
                    DiaChi = item.DiaChiCty,
                    SoDT = item.SdtCty,

                });
            }


            return ct;
        }

        [HttpPost]
        public bool InsertCty(string tenCty, string Diachi, string SoDT)
        {
            try
            {

                CongTy congty = new CongTy();
                congty.TenCty = tenCty;
                congty.DiaChiCty = Diachi;
                congty.SdtCty = SoDT;
                db.CongTies.Add(congty);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }

        }
        [HttpPut]
        public bool UpdateCTy(string tenCty, string Diachi, string SoDT)
        {
            try
            {
                CongTy congty = new CongTy();
                congty = db.CongTies.FirstOrDefault(n => n.TenCty == tenCty);

                if (congty == null) return false;
                congty.TenCty = tenCty;
                congty.DiaChiCty = Diachi;
                congty.SdtCty = SoDT;
                db.Entry(congty).State = System.Data.Entity.EntityState.Modified;
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
