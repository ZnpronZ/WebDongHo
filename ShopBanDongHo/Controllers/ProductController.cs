using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;
using PagedList;
using System.Net;
using System.Data.Entity;
using PagedList.Mvc;
using ShopBanDongHo.ModelData;

namespace ShopBanDongHo.Controllers
{
    public class ProductController : Controller
    {
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();

        // GET: Product
        public ActionResult Index()
        {
            return View(db.ChiTietDongHoes.ToList());
        }
        public ViewResult CategoryThuongHieu(string ThuongHieu)
        {
            List<ChiTietDongHo> lstSanPham = db.ChiTietDongHoes.Where(x => x.ThuongHieu == ThuongHieu).OrderBy(x => x.MaSP).ToList();
            if (lstSanPham.Count == 0)
            {
                ViewBag.SanPham = "Không có sản phẩm nào thuộc loại này";
            }
            //ViewBag.lstSanPham = db.tDanhMucSP.ToList();
            return View(db.ChiTietDongHoes.Where(n => n.ThuongHieu == ThuongHieu).OrderBy(n => n.MaSP).ToList());
        }
        public ViewResult CategoryXuatXu(string XuatXu)
        {
            List<ChiTietDongHo> lstSanPham = db.ChiTietDongHoes.Where(x => x.XuatXu == XuatXu).OrderBy(x => x.MaSP).ToList();
            if (lstSanPham.Count == 0)
            {
                ViewBag.SanPham = "Không có sản phẩm nào thuộc loại này";
            }
            //ViewBag.lstSanPham = db.tDanhMucSP.ToList();
            return View(db.ChiTietDongHoes.Where(n => n.XuatXu == XuatXu).OrderBy(n => n.MaSP).ToList());
        }
        public ViewResult CategoryNam()
        {
            List<ChiTietDongHo> lstSanPham = db.ChiTietDongHoes.Where(x => x.GioiTinh == "nam").OrderBy(x => x.MaSP).ToList();
            if (lstSanPham.Count == 0)
            {
                ViewBag.SanPham = "Không có sản phẩm nào thuộc loại này";
            }
            //ViewBag.lstSanPham = db.tDanhMucSP.ToList();
            return View(db.ChiTietDongHoes.Where(x => x.GioiTinh == "nam").OrderBy(n => n.MaSP).ToList());
        }
        public ViewResult CategoryNu()
        {
            List<ChiTietDongHo> lstSanPham = db.ChiTietDongHoes.Where(x => x.GioiTinh == "nu").OrderBy(x => x.MaSP).ToList();
            if (lstSanPham.Count == 0)
            {
                ViewBag.SanPham = "Không có sản phẩm nào thuộc loại này";
            }
            //ViewBag.lstSanPham = db.tDanhMucSP.ToList();
            return View(db.ChiTietDongHoes.Where(x => x.GioiTinh == "nu").OrderBy(n => n.MaSP).ToList());
        }
        public ActionResult ChiTietSP(String MaSP)
        {
            ChiTietDongHo sanpham = db.ChiTietDongHoes.Single(n => n.MaSP == MaSP);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanpham);
        }
    }
}