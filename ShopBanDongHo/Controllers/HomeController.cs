using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;
using PagedList;
using PagedList.Mvc;
using common;
namespace ShopBanDongHo.Controllers
{
    public class HomeController : Controller
    {
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Blog(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 3;
            return View(db.Blogs.ToList().ToPagedList(pageNumber, pageSize));
        }
        public ActionResult chitietBlog(string MaBlog)
        {
            Blog blog = db.Blogs.Where(n => n.MaBlog == MaBlog).SingleOrDefault();
            if (blog == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(blog);
        }
        public ActionResult Subcribe(FormCollection f)
        {
            String ToEmail = f["txtEmail"].ToString();
            string content = System.IO.File.ReadAllText(Server.MapPath("~/client/Subcribe.html"));

            new MailHelper().SendMail(ToEmail, "Đăng ký theo dõi thành công", content);
            return RedirectToAction("Index", "Home");
        }
    }
}
