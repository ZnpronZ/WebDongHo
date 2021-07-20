using ShopBanDongHo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace ShopBanDongHo.Controllers
{

    public class AdminSPController : ApiController
    {
        private readonly QuanLiDongHoEntities db = new QuanLiDongHoEntities();

        //1. Dịch vụ lấy thông tin của toàn bộ sản phẩm
        [HttpGet]
        [Route("api/product")]
        public JsonResult<List<ChiTietDongHo>> GetAllProducts()
        {
            var products = db.ChiTietDongHoes;
            return Json<List<ChiTietDongHo>>(products.ToList());
        }

        //2. Dịch vụ lấy thông tin một sản phẩm với mã nào đó
        [Route("api/product/{productId}")]
        [HttpGet]
        public JsonResult<ChiTietDongHo> GetEmployee(string productId)
        {
            ChiTietDongHo product = db.ChiTietDongHoes.Where(p => p.MaSP == productId).FirstOrDefault();
            return Json<ChiTietDongHo>(product);
        }

        //3. HttpPost, dịch vụ thêm mới một sản phẩm
        [HttpPost]
        public JsonResult<bool> InsertProduct([FromBody] ChiTietDongHo product)
        {
            bool status;
            try
            {
                db.Entry(product).State = EntityState.Modified;
                db.ChiTietDongHoes.Add(product);
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

        //4. httpPut để chỉnh sửa thông tin một sản phẩm
        [HttpPut]
        public JsonResult<bool> UpdateProduct(ChiTietDongHo productInfo)
        {
            bool status;
            try
            {
                ChiTietDongHo product = db.ChiTietDongHoes.Where(p => p.MaSP == productInfo.MaSP).FirstOrDefault();
                if (product != null)
                {
                    product.TenSP = productInfo.TenSP;
                    product.ThuongHieu = productInfo.ThuongHieu;
                    product.XuatXu = productInfo.XuatXu;
                    product.GioiTinh = productInfo.GioiTinh;
                    //product.Anh = productInfo.Anh;
                    product.Gia = productInfo.Gia;
                    product.chatLieuMat = productInfo.chatLieuMat;
                    product.duongKinhMat = productInfo.duongKinhMat;
                    product.chatLieuDay = productInfo.chatLieuDay;
                    product.sizeDay = productInfo.sizeDay;
                    product.chatLieuVo = productInfo.chatLieuVo;
                    product.duongKinhVo = productInfo.duongKinhVo;
                    product.timeBaoHanh = productInfo.timeBaoHanh;
                    product.active = true;
                    db.Entry(product).State = EntityState.Modified;
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

        //5. httpDelete để xóa một sản phẩm
        [Route("api/product/{productId}")]
        [HttpDelete]
        public JsonResult<bool> DeleteProduct(string productId)
        {
            bool status;
            try
            {
                QuanLiDongHoEntities db = new QuanLiDongHoEntities();
                ChiTietDongHo product = db.ChiTietDongHoes.Where(p => p.MaSP == productId).FirstOrDefault();
                if (product != null)
                {
                    db.Entry(product).State = EntityState.Modified;
                    db.ChiTietDongHoes.Remove(product);
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

        [Route("api/product/status/{productId}")]
        [HttpGet]
        public JsonResult<bool> Status(string productId)
        {
            bool result = false;
            ChiTietDongHo product = db.ChiTietDongHoes.Find(productId);
            if (product != null)
            {
                product.active = (product.active) ? false : true;
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                result = true;
            }
            return Json<bool>(result);
        }
    }
}
