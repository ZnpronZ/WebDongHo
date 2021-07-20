let customerDataTable;
$(document).ready(function () {
    $.ajax({
        url: "https://localhost:44374/api/customer",
        type: "GET",
        dataType: "json",
        success: function (data) {
            customerDataTable = $('#customerTable').DataTable({
                data: data,
                columns: [
                    { data: 'MaKH', autowidth: "true" },
                    { data: 'TenKH' },
                    { data: 'GioiTinh' },
                    { data: 'DiaChi' },
                    { data: 'Email' },
                    { data: 'SoDT' },
                    {
                        data: 'MaKH', width: "50px", render: function (data) {
                            return "<button class='btn btn-success' onclick='getCustomers(" + data + ")'>Edit</button>";
                        }
                    },
                    {
                        data: 'MaKH', width: "50px", render: function (data) {
                            return "<button class='btn btn-danger' onclick='deleteCustomer(" + data + ")'>Delete</button>";
                        }
                    }
                ],
                language: {
                    "processing": "Đang xử lý...",
                    "lengthMenu": "Xem _MENU_ mục",
                    "zeroRecords": "Không tìm thấy dòng nào phù hợp",
                    "info": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "infoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "infoFiltered": "(được lọc từ _MAX_ mục)",
                    "search": "Tìm kiếm khách hàng:",
                    "paginate": {
                        "first": "Đầu",
                        "previous": "Trước",
                        "next": "Tiếp",
                        "last": "Cuối"
                    }
                }
            });

            $('#tableId_filter input[type="search"]').on('keyup', function () {
                table.search(this.value).draw();
            });
        },
        error: function (err) {
            console.log(err);
        }
    });
});

function getCustomers(id) {
    $.get("GetCustomerPartial", { id: id }, function (res) {
        $("#customerModalBody").html(res);
        $("#customerModal").modal("show");
    });
}

function createOrUpdate(reqType) {
    let modal = $("#customerModal");
    let form = $("form[name='customerForm']");
    $.validator.addMethod("genderValidation", function (value, element) {
        return this.optional(element) || value == "Nam" || value == "Nữ";
    }, "Giới tính bạn nhập chưa chính xác");
    /((09|03|07|08|05)+([0-9]{8})\b)/g
    $.validator.addMethod("phoneValidation", function (value, element) {
        return this.optional(element) || /((09|03|07|08|05)+([0-9]{8})\b)/g.test(value);
    }, "Số điện thoại không hợp lệ");
    form.validate({
        lang: "vi",
        rules: {
            "GioiTinh": { genderValidation: true },
            "Email": {
                email: true
            },
            "SoDT": {
                phoneValidation: true
            },
            "MatKhau": {
                required: true,
                minlength: 8
            }
        }
    });
    if (!form.valid()) {
        return;
    }
    else {
        let customerData = form.serialize();
        customerData += "&MaKH=" + $("#MaKH").val(); // Mã Khách Hàng
        customerData += "&TenTK=" + $("#TenTK").val(); // Tên Tài Khoản
        if (reqType == "POST") {
            $.post("https://localhost:44374/api/customer", customerData, function (res) {
                console.log(res);
                if (res) {
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                    alert("Thêm khách hàng thành công");
                }
                else {
                    alert("Thêm khách hàng thất bại. Khách hàng hoặc mã khách hàng đã tồn tại.");
                }
            });
        }
        else if (reqType == "PUT") {
            $.ajax({
                url: "https://localhost:44374/api/customer",
                type: reqType,
                data: customerData,
                success: function (res) {
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                    alert("Cập nhật thông tin khách hàng thành công");
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
        modal.modal("hide");
    }
}

function deleteCustomer(id) {
    $.ajax({
        url: "https://localhost:44374/api/customer/" + id,
        type: "DELETE",
        success: function (res) {
            if (res) {
                alert("Xóa khách hàng thành công");
                setTimeout(function () {
                    location.reload();
                }, 1000);
            }
            else {
                alert("Xóa khách hàng thất bại");
            }

        }
    });
}