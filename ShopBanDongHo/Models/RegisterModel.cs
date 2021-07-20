using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ShopBanDongHo.Models
{
    public class RegisterModel

    {
        [Display(Name = " Tên Đăng Nhập")]
        [Required(ErrorMessage = "Yêu cầu Tên Đăng Nhập")]
        public string TaiKhoan { get; set; }
        [Display(Name = " Mật Khẩu")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Độ Dài mật khẩu ít nhất 6 kí tự")]
        [Required(ErrorMessage = "Yêu cầu Nhập Mật Khẩu")]
        public string MatKhau { get; set; }

        [NotMapped]
        [Display(Name = " Xác Nhận Mật Khẩu")]
        [Compare("MatKhau", ErrorMessage = " Xác Nhận Mật Khẩu Không Đúng")]
        public string XacNhanMatKhau { get; set; }
        [Display(Name = " Họ Tên")]
        public string TenKH { get; set; }
        [Display(Name = " Địa Chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = " Email")]
        public string Email { get; set; }
        [Display(Name = " Điện Thoại")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number")]
        public string SoDT { get; set; }
        public DateTime Date { get; set; }
        [Display(Name = "Giới Tính")]
        public string GioiTinh { get; set; }


    }
}