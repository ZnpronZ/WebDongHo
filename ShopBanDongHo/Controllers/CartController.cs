using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBanDongHo.Models;
using ShopBanDongHo.ModelData;
using System.Web.Script.Serialization;
namespace ShopBanDongHo.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = (List<CartItem>)cart;
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Delete(String MaSP)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.chitietdongho.MaSP == MaSP);
            Session[CartSession] = sessionCart;

            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.chitietdongho.MaSP == item.chitietdongho.MaSP);
                if (jsonItem != null)
                {
                    item.SoLuong = jsonItem.SoLuong;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult AddItem(string MaSP, int SoLuong, FormCollection f)
        {

            QuanLiDongHoEntities db = new QuanLiDongHoEntities();
            var chitietdongho = db.ChiTietDongHoes.Find(MaSP);
            var cart = Session[CartSession];
            if (cart != null)
            {

                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.chitietdongho.MaSP == MaSP))
                {
                    foreach (var item in list)
                    {
                        if (item.chitietdongho.MaSP == MaSP)
                        {
                            item.SoLuong += SoLuong;
                        }
                    }
                }
                else
                {
                    //tạo mới đối tượng cart item
                    var item = new CartItem();
                    item.chitietdongho = chitietdongho;
                    item.SoLuong = SoLuong;
                    list.Add(item);

                }
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới đối tượng cart item
                var item = new CartItem();
                item.chitietdongho = chitietdongho;
                item.SoLuong = SoLuong;
                var list = new List<CartItem>();
                list.Add(item);
                //Gán vào session
                Session[CartSession] = list;
            }

            return RedirectToAction("Index", "Cart");

        }
        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = (List<CartItem>)cart;
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string shipName, string shipMobile, string shipAdress, string email)
        {
            QuanLiDongHoEntities db = new QuanLiDongHoEntities();
            var hoadon = new HoaDon();
            hoadon.NgayTao = DateTime.Now;
            hoadon.ShipAdress = shipAdress;
            hoadon.ShipMobile = shipMobile;
            hoadon.ShipName = shipName;
            hoadon.ShipEmail = email;
            var id = new Order().Insert(hoadon);
            var cart = (List<CartItem>)Session[CartSession];
            var orderDetail = new orderdetail();
            foreach (var item in cart)
            {
                var chitiet = new ChiTietHoaDon();
                chitiet.MaSP = item.chitietdongho.MaSP;
                chitiet.MaHD = int.Parse(id.ToString());
                chitiet.SoLuong = item.SoLuong;
                chitiet.TongTien = item.chitietdongho.Gia;
                orderDetail.Insert(chitiet);
            }
            return RedirectToAction("Success", "Cart");
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}