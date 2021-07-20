using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;


namespace ShopBanDongHo.Controllers
{
    public class SearchController : Controller
    {
        // GET: TimKiem
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection f)

        {
            string searchKey = f["txtTimKiem"].ToString();
            ViewBag.keyword = searchKey;
            List<ChiTietDongHo> lstKQTK = db.ChiTietDongHoes.Where(n => n.TenSP.Contains(searchKey)).ToList();
            //phan trang
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Khong tim thay san pham nao";
                return View(db.ChiTietDongHoes.OrderBy(n => n.TenSP).ToList());//xuat toan bo san pham

            }
            ViewBag.ThongBao = "Da tim thay" + lstKQTK.Count + "ket qua";
            return View(lstKQTK.OrderBy(n => n.TenSP).ToList());
        }
        [HttpGet]
        public ActionResult KetQuaTimKiem(string searchkey)

        {
            ViewBag.keyword = searchkey;

            List<ChiTietDongHo> lstKQTK = db.ChiTietDongHoes.Where(n => n.TenSP.Contains(searchkey)).ToList();
            //phan trang
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Khong tim thay san pham nao";
                return View(db.ChiTietDongHoes.OrderBy(n => n.TenSP).ToList());//xuat toan bo san pham

            }
            ViewBag.ThongBao = "Da tim thay" + lstKQTK.Count + "ket qua";
            return View(lstKQTK.OrderBy(n => n.TenSP).ToList());
        }
    }
}