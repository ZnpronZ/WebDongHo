using ShopBanDongHo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace ShopBanDongHo.Controllers
{
    public class CustomerController : ApiController
    {
        private readonly QuanLiDongHoEntities db = new QuanLiDongHoEntities();
        //1. Dịch vụ lấy thông tin của toàn bộ khách hàng
        [Route("api/customer")]
        [HttpGet]
        public JsonResult<List<KhachHang>> GetAllCustomers()
        {
            List<KhachHang> customers = db.KhachHangs.ToList<KhachHang>();
            return Json<List<KhachHang>>(customers);
        }

        //2. Dịch vụ lấy thông tin một khách hàng với mã nào đó
        [Route("api/customer/{customerId}")]
        [HttpGet]
        public JsonResult<KhachHang> GetEmployee(int customerId)
        {
            KhachHang customer = db.KhachHangs.Where(kh => kh.MaKH == customerId).FirstOrDefault();
            return Json<KhachHang>(customer);
        }

        //3. HttpPost, dịch vụ thêm mới một khách hàng
        // {MaNV: "NV07", HoTen:"Nguyen Van A", SDT: "159357258", DiaChi: "Ha Noi", Luong: 555555}
        // ?employee={MaNV: "NV07", HoTen:"Nguyen Van A", SDT: "159357258", DiaChi: "Ha Noi", Luong: 555555}
        // Dùng ajax gửi post request from body
        [Route("api/customer")]
        [HttpPost]
        public JsonResult<bool> InsertCustomer([FromBody] KhachHang customer)
        {
            bool status;
            KhachHang kh = db.KhachHangs.Find(customer.MaKH);
            if (kh != null)
            {
                status = false;
                return Json<bool>(status);
            }
            try
            {
                db.KhachHangs.Add(customer);
                db.SaveChanges();
                status = true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                status = false;
            }
            return Json<bool>(status);
        }

        //4. httpPut để chỉnh sửa thông tin một nhân viên
        [Route("api/customer")]
        [HttpPut]
        public JsonResult<bool> UpdateCustomer(KhachHang customerInfo)
        {
            bool status;
            try
            {
                KhachHang customer = db.KhachHangs.Where(kh => kh.MaKH == customerInfo.MaKH).FirstOrDefault();
                if (customer != null)
                {
                    customer.MaKH = customerInfo.MaKH;
                    customer.TenKH = customerInfo.TenKH;
                    customer.NgaySinh = customerInfo.NgaySinh;
                    customer.GioiTinh = customerInfo.GioiTinh;
                    customer.AnhDaiDien = customerInfo.AnhDaiDien;
                    customer.DiaChi = customerInfo.DiaChi;
                    customer.SoDT = customerInfo.SoDT;
                    customer.Email = customerInfo.Email;
                    customer.TenTK = customerInfo.TenTK;
                    customer.MatKhau = customerInfo.MatKhau;
                    db.SaveChanges();
                    status = true;
                }
                else
                {
                    status = false;
                }

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                status = false;
            }
            return Json<bool>(status);
        }

        //5. httpDelete để xóa một khách hàng
        [Route("api/customer/{customerId}")]
        [HttpDelete]
        public JsonResult<bool> DeleteCustomer(int customerId)
        {
            bool status;
            try
            {
                QuanLiDongHoEntities db = new QuanLiDongHoEntities();
                KhachHang customer = db.KhachHangs.Where(kh => kh.MaKH == customerId).FirstOrDefault();
                if (customer != null)
                {
                    db.KhachHangs.Remove(customer);
                    db.SaveChanges();
                }
                status = true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                status = false;
            }
            return Json<bool>(status);
        }

        //[Route("api/CreateOrUpdateCustomer/{kh?}")]
        //[HttpPost]
        //public IHttpActionResult CreateOrUpdateCustomer(KhachHang kh)
        //{
        //    if(ModelState.IsValid)
        //    {
        //        if(kh.userID > 0)
        //        {
        //            db.Entry(kh).State = System.Data.Entity.EntityState.Modified;
        //        }
        //        else
        //        {
        //            db.KhachHangs.Add(kh);
        //        }
        //        db.SaveChanges();
        //        return Json(true);
        //    }

        //    return Json(false);
        //}

    }
}

/* Thêm config.MapHttpAttributeRoutes(); vào WebApiConfig.cs
 * Thêm section để viết javascript bên admin customer index view
 * Thêm phần datatable link vào layout Admin
 * <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css"/>
 * <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>
 * Viết hàm lấy customer trong database trả về 1 partial view
 * Tạo mới một Partial View
 * Install package: Install-Package jQuery.Validation
 * <link href="~/Areas/Admin/Assets/dist/css/custom.css" rel="stylesheet" type="text/css"/>
 * <script type="text/javascript" src="~/Scripts/jquery.validate.min.js"></script>
 * 
 * 
 */
