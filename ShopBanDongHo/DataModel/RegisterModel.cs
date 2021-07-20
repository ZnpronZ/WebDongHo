using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopBanDongHo.Models
{
    public class RegisterMod
    {
        [ Display(Name=" Tên Đăng Nhập")]
        [Required(ErrorMessage ="Yêu cầu Tên Đăng Nhập")]
        public string UserName { get; set; }
        [Display(Name = " Mật Khẩu")]
        [StringLength(20,MinimumLength =6,ErrorMessage ="Độ Dài mật khẩu ít nhất 6 kí tự")]
        [Required(ErrorMessage = "Yêu cầu Nhập Mật Khẩu")]
        public string PassWord { get; set; }
        [Display(Name = " Xác Nhận Mật Khẩu")]
        [Compare("PassWord",ErrorMessage =" Xác Nhận Mật Khẩu Không Đúng")]
        public string ConfirmPassWord { get; set; }
        [Display(Name = " Họ Tên")]
        public string Name { get; set; }
        [Display(Name = " Địa Chỉ")]
        public string Adress { get; set; }
        [Display(Name = " Email")]
        public string Email { get; set; }

        [Display(Name = " Điện Thoại")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number")]
        public string PhoneNumber { get; set; }
    }
}