using ShopBanDongHo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopBanDongHo.Areas.Admin.Controllers
{
    public class AdminEmployeeController : Controller
    {
        private readonly QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        // GET: Admin/AdminEmployee
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetEmployeePartial(int? id)
        {
            var employee = db.NhanViens.Find(id) ?? new NhanVien();
            return PartialView("CreateOrUpdateEmployeePartial", employee);
        }
    }
}