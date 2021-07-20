using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;
using System.Web.Http.Description;
using ShopBanDongHo.Models;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using ShopBanDongHo.ModelData;
namespace ShopBanDongHo.Controllers
{
    public class BillsController : ApiController
    {
        private QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        // class thoadon ben dataModel nhé
        // GET: api/Bills
        public IEnumerable<tHoaDon> GetHoaDons()
        {
            IList<tHoaDon> hd = new List<tHoaDon>();
            var dsHD = from a in db.HoaDons select a;
            foreach (var item in dsHD)
            {
                hd.Add(new tHoaDon
                {
                    MaHD = item.MaHD,
                    NgayTao = DateTime.Parse(item.NgayTao.ToString()),
                    MaKH = item.MaKH,
                    ShipName = item.ShipName,
                    ShipMobile = item.ShipMobile,
                    ShipAdress = item.ShipAdress,
                    ShipEmail = item.ShipEmail,
                    Status = (int)item.Status


                });
            }


            return hd;
        }
        //srear Hd
        // GET: api/Bills/GetHoaDonsbyname/?id=5
        [HttpGet]
        public IEnumerable<tHoaDon> GetHoaDonsbyname(string id)
        {
            IList<tHoaDon> hds = new List<tHoaDon>();
            var dsHD = db.HoaDons.Where(n => n.ShipAdress.Contains(id)).ToList();
            foreach (var item in dsHD)
            {
                hds.Add(new tHoaDon
                {

                    MaHD = item.MaHD,
                    NgayTao = DateTime.Parse(item.NgayTao.ToString()),
                    MaKH = item.MaKH,
                    ShipName = item.ShipName,
                    ShipMobile = item.ShipMobile,
                    ShipAdress = item.ShipAdress,
                    ShipEmail = item.ShipEmail,
                    Status = (int)item.Status
                });
            }
            return hds;
        }
        [Route("GetChitetHoaDon/{MaHD}")]
        [HttpGet]
        public IEnumerable<tChiTietHoaDon> GetCTByMaHD(int MaHD)
        {


            IList<tChiTietHoaDon> ctHD = new List<tChiTietHoaDon>();
            var listCTHD = db.ChiTietHoaDons.Where(n => n.MaHD == MaHD).ToList();
            foreach (var item in listCTHD)
            {
                ctHD.Add(new tChiTietHoaDon
                {
                    MaSP = item.MaSP,
                    MaHD = (int)item.MaHD,
                    TenSP = db.ChiTietDongHoes.FirstOrDefault(m => m.MaSP == item.MaSP).TenSP,
                    SoLuong = (int)item.SoLuong,
                    TongTien = (int)item.SoLuong * (int)db.ChiTietDongHoes.FirstOrDefault(m => m.MaSP == item.MaSP).Gia,

                });

            }


            return ctHD;

        }

        // Delete: api/HoaDons delete hd
        [HttpDelete]
        public bool Delete(string MahoaDon)
        {


            try
            {
                HoaDon dbHD = db.HoaDons.FirstOrDefault(n => n.MaHD == int.Parse(MahoaDon));
                if (dbHD == null) return false;
                db.HoaDons.Remove(dbHD);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;

            }
        }

        // PUT: api/HoaDons/5
        [HttpPost]
        public bool InsertHoaDon(DateTime NgayTao, string MaKH, string ShipName, string ShipMobile, string ShipAdress, string ShipEmail)
        {
            try
            {

                HoaDon hoaDon = new HoaDon();
                hoaDon.NgayTao = NgayTao;
                hoaDon.MaKH = MaKH;
                hoaDon.ShipName = ShipName;
                hoaDon.ShipMobile = ShipMobile;
                hoaDon.ShipAdress = ShipAdress;
                hoaDon.ShipEmail = ShipEmail;
                hoaDon.Status = 1;
                db.HoaDons.Add(hoaDon);
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
