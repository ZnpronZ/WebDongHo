using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;
using ShopBanDongHo.ModelData;
namespace ShopBanDongHo.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/AdminHome
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListHoaDon()
        {
            return View();
        }
        public ActionResult ListCompany()
        {
            return View();
        }
        public ActionResult CreateCompany()
        {
            return View();
        }
        public ActionResult Chart()
        {
            return View();
        }
        QuanLiDongHoEntities db = new QuanLiDongHoEntities();

        [HttpGet]
        public ActionResult CreateBlog()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateBlog(tBlog blog)//tao 1 lop blog
        {//Tao  1 menu blog
            if (blog.TieuDe == null)
            {
                ViewBag.GuiBlog = "";
                return View(blog);
            }
            if (blog.TenNgPost == null || blog.AnhBlog == null || blog.AnhBlogNho == null)
            {
                ViewBag.GuiBlog = "";
                return View(blog);
            }

            string MaBlogs = (Int32.Parse(db.Blogs.OrderByDescending(n => n.MaBlog).FirstOrDefault().MaBlog.Replace("MB", "")) + 1).ToString();
            if (MaBlogs.Length == 1)
            {
                MaBlogs = "0" + MaBlogs;
            }
            Blog newblog = new Blog();
            newblog.MaBlog = "MB" + MaBlogs;
            newblog.TieuDe = blog.TieuDe;
            newblog.NgPost = blog.TenNgPost;
            newblog.ThoiGian = DateTime.Now;
            newblog.AnhBlog = blog.AnhBlog;
            newblog.AnhBlog_nho = blog.AnhBlogNho;
            newblog.NoiDung = blog.NoiDung;

            db.Blogs.Add(newblog);
            db.SaveChanges();
            ViewBag.GuiBlog = "oke";

            return View();
        }
    }
}