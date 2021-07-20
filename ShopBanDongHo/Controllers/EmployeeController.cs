using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using ShopBanDongHo.Models;

namespace ShopBanDongHo.Controllers
{
    public class EmployeeController : ApiController
    {
        private readonly QuanLiDongHoEntities db = new QuanLiDongHoEntities();

        //1. Dịch vụ lấy thông tin của toàn bộ nhân viên
        [Route("api/employee")]
        [HttpGet]
        public JsonResult<List<NhanVien>> GetAllEmployees()
        {
            var employees = db.NhanViens;
            return Json<List<NhanVien>>(employees.ToList<NhanVien>());
        }

        //2. Dịch vụ lấy thông tin một nhân viên với mã nào đó
        [Route("api/employee/{employeeId}")]
        [HttpGet]
        public JsonResult<NhanVien> GetEmployee(int employeeId)
        {
            NhanVien employee = db.NhanViens.Where(e => e.MaNV == employeeId).FirstOrDefault();
            return Json<NhanVien>(employee);
        }

        //3. HttpPost, dịch vụ thêm mới một nhân viên
        // {MaNV: "NV07", HoTen:"Nguyen Van A", SDT: "159357258", DiaChi: "Ha Noi", Luong: 555555}
        // ?employee={MaNV: "NV07", HoTen:"Nguyen Van A", SDT: "159357258", DiaChi: "Ha Noi", Luong: 555555}
        // Dùng ajax gửi post request from body
        [Route("api/employee")]
        [HttpPost]
        public JsonResult<bool> InsertEmployee([FromBody] NhanVien employee)
        {
            bool status;
            try
            {
                db.Entry(employee).State = EntityState.Modified;
                db.NhanViens.Add(employee);
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
        [Route("api/employee")]
        [HttpPut]
        public JsonResult<bool> UpdateEmployee(NhanVien employeeInfo)
        {
            bool status = false;
            try
            {
                NhanVien employee = db.NhanViens.Where(e => e.MaNV == employeeInfo.MaNV).FirstOrDefault();
                if (employee != null)
                {
                    employee.TenNV = employeeInfo.TenNV;
                    employee.SoDT = employeeInfo.SoDT;
                    employee.DiaChi = employeeInfo.DiaChi;
                    employee.Luong = employeeInfo.Luong;
                    db.Entry(employee).State = EntityState.Modified;
                    db.SaveChanges();
                    status = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                status = false;
            }
            return Json<bool>(status);
        }

        //5. httpDelete để xóa một nhân viên
        [Route("api/employee/{employeeId}")]
        [HttpDelete]
        public JsonResult<bool> DeleteEmployee(int employeeId)
        {
            bool status;
            try
            {
                QuanLiDongHoEntities db = new QuanLiDongHoEntities();
                NhanVien employee = db.NhanViens.Where(e => e.MaNV == employeeId).FirstOrDefault();
                if (employee != null)
                {
                    db.Entry(employee).State = EntityState.Modified;
                    db.NhanViens.Remove(employee);
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

    }
}
