using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
 
namespace ShopBanDongHo.ModelData
{
    public class tBlog
    {   [Required]
        
        public string TieuDe { get; set; }
        [Required]
        public string TenNgPost { get; set; }
        [Required]
        public string AnhBlog { get; set; }
        [Required]
        public string AnhBlogNho { get; set; }
        [Required]
        public string NoiDung { get; set; }
      
    }
}