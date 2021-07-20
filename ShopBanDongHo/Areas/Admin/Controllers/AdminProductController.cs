using ShopBanDongHo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopBanDongHo.Areas.Admin.Controllers
{
    public class AdminProductController : Controller
    {
        private readonly QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        // GET: Admin/AdminProduct
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetProductPartial(string productId)
        {
            var product = db.ChiTietDongHoes.Find(productId);
            if(product != null) { 
                return PartialView("CreateOrUpdateProductPartial", product);
            }
            return PartialView("CreateOrUpdateProductPartial");
        }
    }
}