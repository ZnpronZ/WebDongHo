using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CaptchaMvc.HtmlHelpers;
using ShopBanDongHo.Models;
namespace ShopBanDongHo.Controllers
{
    public class RegisterController : Controller
    {
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        // GET: Resiger
        [HttpGet]
        public ActionResult CreateAccount()
        {

            return View();

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateAccount(RegisterModel account)
        {
            if (account.TaiKhoan == "" || account.MatKhau == ""
                || account.Email == "" || account.TenKH == ""
                || account.SoDT == "" || account.DiaChi == "")
            {
                return View(account);
            }
            if (db.KhachHangs.FirstOrDefault(n => n.TenTK == account.TaiKhoan) != null)
            {

                ViewBag.TaiKhoan = "Tên tài khoản đã tồn tại";
                return View(account);
            }
            if (account.GioiTinh == null)
            {

                return View(account);
            }
            else if (account.GioiTinh.ToLower() != "nam" && account.GioiTinh.ToLower() != "nu")
            {
                ViewBag.GT = "Vui long nhap nam hoac nu ";
                return View(account);
            }
            if (account.XacNhanMatKhau != account.MatKhau)
            {

                return View(account);

            }
            if (!this.IsCaptchaValid(""))
            {
                ViewBag.error = "Invalid Captcha";
                return View(account);
            }
            KhachHang tk = new KhachHang()
            {
                MaKH = int.Parse(db.KhachHangs.OrderByDescending(n => n.MaKH).FirstOrDefault().MaKH.ToString()) + 1,
                TenTK = account.TaiKhoan,
                TenKH = account.TenKH,
                MatKhau = account.MatKhau,
                DiaChi = account.DiaChi,
                NgaySinh = account.Date,
                Email = account.Email,
                SoDT = account.SoDT,
                GioiTinh = account.GioiTinh
            };
            db.KhachHangs.Add(tk);
            db.SaveChanges();
            return RedirectToAction("Success", "Register");
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}