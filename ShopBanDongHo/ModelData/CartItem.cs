using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopBanDongHo.Models;
namespace ShopBanDongHo.ModelData
{
    [Serializable]
    public class CartItem
    {
        
        public ChiTietDongHo chitietdongho { get; set; }

        public int SoLuong { get; set; }


    }
}