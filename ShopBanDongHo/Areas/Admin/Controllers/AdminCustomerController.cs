using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using ShopBanDongHo.Models;

namespace ShopBanDongHo.Areas.Admin.Controllers
{
    public class AdminCustomerController : Controller
    {
        private QuanLiDongHoEntities db = new QuanLiDongHoEntities();

        // GET: Admin/Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetCustomerPartial(int? id)
        {
            var customer = db.KhachHangs.Find(id) ?? new KhachHang();
            return PartialView("CreateOrUpdateCustomerPartial", customer);
        }
    }
}