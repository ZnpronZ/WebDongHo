using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;
using ShopBanDongHo.DataModel;
using System.Security.Cryptography;
using System.Text;

namespace ShopBanDongHo.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserLogin user)//tao class user trong  datamodel
        {
            if (user == null)
            {
                ViewBag.Errol = "Vui long dien thong tin";
            }
            //kiemtra tai khoan
            var khachhang = from taikhoan in db.KhachHangs
                            where taikhoan.TenTK == user.UserName
                            where taikhoan.MatKhau == user.PassWorld
                            select taikhoan;

            if (khachhang.FirstOrDefault() != null)
            {
                Session["TaiKhoan"] = khachhang.FirstOrDefault().TenKH; // tao session cho tai khoan de hien thi 
                //sang trang home;
                return RedirectToAction("Index", "Home");
            }
            else
                return RedirectToAction("Login", "Login");
        }
        public ActionResult Logout()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}