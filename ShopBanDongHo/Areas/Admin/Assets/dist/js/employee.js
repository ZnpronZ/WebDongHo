let employeeDataTable;
$(document).ready(function () {
    $.ajax({
        url: "https://localhost:44374/api/employee",
        type: "GET",
        dataType: "json",
        success: function (data) {
            employeeDataTable = $('#employeeTable').DataTable({
                data: data,
                columns: [
                    { data: 'MaNV', autowidth: "true" },
                    { data: 'TenNV' },
                    { data: 'SoDT' },
                    { data: 'DiaChi' },
                    { data: 'Luong' },
                    {
                        data: 'MaNV', width: "50px", render: function (data) {
                            return "<button class='btn btn-success' onclick='getEmployees(" + data + ")'>Sửa</button>";
                        }
                    },
                    {
                        data: 'MaNV', width: "50px", render: function (data) {
                            return "<button class='btn btn-danger' onclick='deleteEmployee(" + data + ")'>Xóa</button>";
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
                    "search": "Tìm kiếm nhân viên:",
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

function getEmployees(id) {
    $.get("GetEmployeePartial", { id: id }, function (res) {
        $("#employeeModalBody").html(res);
        $("#employeeModal").modal("show");
    });
}

function createOrUpdate(reqType) {
    let modal = $("#employeeModal");
    let form = $("form[name='employeeForm']");
    
    // -- Validate SDT: /((09|03|07|08|05)+([0-9]{8})\b)/g
    $.validator.addMethod("phoneValidation", function (value, element) {
        return this.optional(element) || /((09|03|07|08|05)+([0-9]{8})\b)/g.test(value);
    }, "Số điện thoại không hợp lệ");
    form.validate({
        lang: "vi",
        rules: {
            "SoDT": {
                phoneValidation: true
            } 
        }
    });
    if (!form.valid()) {
        return;
    }
    else {
        let employeeData = form.serialize();
        employeeData += "&MaNV=" + $("#MaNV").val();
        console.log(employeeData);
        if (reqType == "POST") {
            $.post("https://localhost:44374/api/employee", employeeData, function (res) {
                if (res) {
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                    alert("Thêm nhân viên thành công");
                }
                else {
                    alert("Thêm nhân viên thất bại. Nhân viên hoặc mã nhân viên đã tồn tại.");
                }
            });
        }
        else if (reqType == "PUT") {
            $.ajax({
                url: "https://localhost:44374/api/employee",
                type: reqType,
                data: employeeData,
                success: function (res) {
                    console.log(res);
                    setTimeout(function () {
                        location.reload();
                    }, 1000);
                    alert("Cập nhật thông tin nhân viên thành công");
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
        modal.modal("hide");
    }
}

function deleteEmployee(id) {
    $.ajax({
        url: "https://localhost:44374/api/employee/" + id,
        type: "DELETE",
        success: function (res) {
            if (res) {
                alert("Xóa nhân viên thành công");
                setTimeout(function () {
                    location.reload();
                }, 1000);
            }
            else {
                alert("Xóa nhân viên thất bại");
            }
        }
    });
}