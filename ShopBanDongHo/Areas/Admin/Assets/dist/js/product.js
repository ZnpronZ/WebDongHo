let productDataTable;

$(document).ready(function () {
    $("#message").hide();
    $.ajax({
        url: "https://localhost:44374/api/product",
        type: "GET",
        success: function (data) {
            productDataTable = $("#productTable").DataTable({
                data: data,
                columns: [
                    { data: 'MaSP' },
                    { data: 'TenSP' },
                    { data: 'ThuongHieu' },
                    { data: 'XuatXu' },
                    { data: 'timeBaoHanh' },
                    { data: 'Gia' },
                    {
                        data: 'active',
                        render: function (data, type, row) {
                            return data ? "Còn hàng" : "Hết hàng";
                        }
                    },
                    {
                        data: 'MaSP', width: "50px", render: function (data) {
                            return "<button class='btn btn-primary' onclick='getProducts(\"" + data + "\")'>Sửa</button>";
                        }
                    },
                    {
                        data: 'MaSP', width: "50px", render: function (data) {
                            return "<button class='btn btn-danger' onclick='deleteProduct(\"" + data + "\")'>Xóa</button>";
                        }
                    },
                    {
                        data: 'MaSP', width: "50px", render: function (data) {
                            return "<input type='checkbox' onclick='changeStatus(\"" + data + "\")'>";
                        }
                    },
                ],
                language: {
                    "processing": "Đang xử lý...",
                    "lengthMenu": "Xem _MENU_ mục",
                    "zeroRecords": "Không tìm thấy dòng nào phù hợp",
                    "info": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "infoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "infoFiltered": "(được lọc từ _MAX_ mục)",
                    "search": "Tìm kiếm sản phẩm: ",
                    "paginate": {
                        "first": "Đầu",
                        "previous": "Trước",
                        "next": "Tiếp",
                        "last": "Cuối"
                    }
                }
            });
        }
    }); // end ajax call
}); // end document ready function

function changeStatus(productId) {
    $.ajax({
        url: "https://localhost:44374/api/product/status/" + productId,
        type: "GET",
        success: function (res) {
            if (res) {
                $("#message").addClass("alert alert-success");
                $("#message").text("Cập nhật thành công");
                $("#message").show().delay(1000).fadeOut("slow");
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        }
    });

}

function deleteProduct(productId) {
    $.ajax({
        url: "https://localhost:44374/api/product/" + productId,
        type: "DELETE",
        success: function (res) {
            if (res) {
                alert("Xóa sản phẩm thành công");
                setTimeout(function () {
                    location.reload();
                }, 1000);
            }
            else {
                alert("Xóa sản phẩm thất bại");
            }
        }
    });
}

function getProducts(productId) {
    $.get("GetProductPartial", { productId: productId }, function (res) {
        $("#productModalBody").html(res);
        $("#productModal").modal("show");
    });
}