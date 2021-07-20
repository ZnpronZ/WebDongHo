var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "https://localhost:44374/Product/Index";
            return false;
        });
        $('#btnPayment').off('click').on('click', function () {
            window.location.href = "https://localhost:44374/Cart/Payment";
            return false;
        });
        $('#btnUpdate').off('click').on('click', function () {
            var listProduct = $('.txtQuantity');
            var cartList = [];
           
            $.each(listProduct, function (i, item) { 
                cartList.push({
                    SoLuong: $(item).val(),
                    chitietdongho: {
                        MaSP: $(item).data('id')
                    }
                });
            });

            $.ajax({
                url: '/Cart/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "https://localhost:44374/Cart";
                    }
                }
            })
        });

        $('#btnDelete').off('click').on('click', function () {
            console.log("gg");

            $.ajax({
                url: '/Cart/DeleteAll',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "https://localhost:44374/Cart";
                    }
                }
            })
        });

        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                data: { MaSP: $(this).data('id') },
                url: '/Cart/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "https://localhost:44374/Cart/Index";
                    }
                }
            })
        });
    }
}
cart.init();