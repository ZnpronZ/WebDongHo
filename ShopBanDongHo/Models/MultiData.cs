using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopBanDongHo.Models
{
    public class MultiData
    {
        public IEnumerable<ChiTietDongHo> sanpham { get; set; }
        public IEnumerable<tThuongHieu> thuonghieu { get; set; }
        public IEnumerable<tXuatXu> xuatxu { get; set; }
    }
}