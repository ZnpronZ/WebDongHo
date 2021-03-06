USE [QuanLiDongHo]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/20/2021 9:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[MaBlog] [nvarchar](50) NOT NULL,
	[AnhBlog] [nvarchar](50) NOT NULL,
	[TieuDe] [nvarchar](30) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[NgPost] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[AnhBlog_nho] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDongHo]    Script Date: 7/20/2021 9:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDongHo](
	[MaSP] [nvarchar](50) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[ThuongHieu] [nvarchar](50) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[Anh] [nvarchar](500) NULL,
	[Gia] [int] NOT NULL,
	[chatLieuMat] [nvarchar](50) NULL,
	[duongKinhMat] [float] NULL,
	[chatLieuDay] [nvarchar](50) NULL,
	[sizeDay] [float] NULL,
	[chatLieuVo] [nvarchar](100) NULL,
	[duongKinhVo] [float] NULL,
	[timeBaoHanh] [float] NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaSP] [nvarchar](50) NOT NULL,
	[MaHD] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK__ChiTietH__2725081C0DDB08DA] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongTy]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTy](
	[TenCty] [nvarchar](50) NOT NULL,
	[DiaChiCty] [nvarchar](50) NOT NULL,
	[SdtCty] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenCty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoanhThu]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoanhThu](
	[MaNgayThang] [nvarchar](30) NOT NULL,
	[DoanhThu] [float] NULL,
	[TongSLBanDc] [int] NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[SoDonBan] [int] NULL,
	[DoanhThuNV] [float] NULL,
	[TenSpBanChay] [nvarchar](50) NULL,
	[SLBan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNgayThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[MaKH] [nvarchar](50) NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAdress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDT] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[TenTK] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[SoDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Luong] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tThuongHieu]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tThuongHieu](
	[ThuongHieu] [nvarchar](50) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tXuatXu]    Script Date: 7/20/2021 9:10:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tXuatXu](
	[XuatXu] [nvarchar](50) NOT NULL,
	[TenXuatXu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[XuatXu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB01', N'TWCO-Air-Controller-003.jpg', N'Sponsored post presented', CAST(N'2021-01-16T00:00:00.000' AS DateTime), N'Mr Vinh', N'At the moment, CoLAB subscribers have the choice of nine different vintage dial variations. Among this bevy of beauties are fan-favorites such as the Salmon dial, which features blued hands, tachymeter, and telemeter scales. The cream-dialed option (number five on the site) features blued leaf hands along with red and blue outer scales. This particular option was actually the exact model that inspired Lebois & Co to release the Heritage Chronograph. A similar example was later discovered and purchased from a U.S.-based collector. The remaining dial options range from gold cases and gilt accents to the classic “sector dial” that gained popularity in the 1940’s and remains a timeless choice today.', N'1.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB02', N'1.jpg', N'This revamped brand', CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'Mr Quang', N'Measuring in at 40mm in diameter and 13.1mm thick, the stainless steel cases of these new Grand Seiko 9F86 GMT models deftly balance athletic design with compact dimensions. The overall case design is faceted, bold, and more than a little reminiscent of Seiko and Grand Seiko’s ‘70s designs, and acts as a fine showcase for the brand’s signature Zaratsu polishing in initial images. Rather than flowing out of the main case or being attached, the short angular lugs feel as though they were cut like gemstones from the block of the main case. This faceted approach should give a multitude of angles for light to play off the polished surfaces, while the tapering chamfer running the length of the case from lug to lug gives a sense of curvature to an otherwise harshly geometric form. The Zaratsu polished surfaces of the lugs and case chamfer are complemented by smooth brushing along the top and flanks of the case. The 4 o’clock signed crown is semi-recessed into the side of the case, eliminating the need for disruptive crown guards while still offering protection to this vital element. Grand Seiko tops the case with a narrow ceramic 24 hour bezel, with the SBGN019 and SBGN023 finishing this element in matte black, whereas the SBGN021 instead opts for a dial-matching midnight blue. For the limited edition SBGN023, Grand Seiko also adds a serial number and the brand’s traditional 18K gold lion medallion to the solid caseback. All three of the new 9F86 GMT models muster a robust 200 meters of water resistance.', N'Dive-Photoshoot-1.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB03', N'Dive-Photoshoot-1.jpg', N'By heeding the voice', CAST(N'2020-02-02T00:00:00.000' AS DateTime), N'Mr Đat', N'Alfred Davis và anh rể là Hans Wilsdorf đã sáng lập nên "Wilsdorf and Davis" tại London nước Anh vào năm 1905 [5], là công ty tiền thân mà sau này trở thành Rolex SA. Thời điểm ban đầu "Wilsdorf and Davis" hoạt động trong lĩnh vực lắp rắp đồng hồ bằng cách nhập khẩu những bộ máy đồng hồ Thụy Sỹ từ nhà sản xuất Hermann Aegler''s đến Anh Quốc và kết hợp với những bộ vỏ đồng hồ chất lượng cao được sản xuất bởi Dennison và các nhà sản xuất khác. Những chiếc đồng hồ đầu tiên của "Wilsdorf and Davis" thường được gắn nhãn "W & D" ở mặt sau đồng hồ.

Sau một thời gian hoạt động thành công, đến năm 1908[6], Wilsdorf đã đăng ký thương hiệu "Rolex" và mở một văn phòng tại La Chaux-de-Fonds, Thụy Sỹ. Đến 15 tháng 11 năm 2015, Rolex chính thức trở thành tên công ty, và được sử dụng như một thương hiệu đồng hồ cho đến tận sau này.

Đến năm 1914, Kew Observatory đã trao cho đồng hồ Rolex một chứng chỉ về độ chính xác loại A, thường được sử dụng để cấp riêng cho các loại đồng hồ hải quân có độ chính xác Marine Chronometer[7].

Năm 1919, do chiến tranh thế giới thứ nhất và các loại thuế nhập khẩu và xuất khẩu quá cao[8] đánh vào các sản phẩm cao cấp xa xỉ sang trọng cũng như các sản phẩm được làm từ vàng và bạc, Wilsdorf đã rời nước Anh và chuyển toàn bộ công ty cũng như các cơ sở sản xuất tới Geneva Thụy Sỹ, nơi Rolex được thành lập trở thành công ty đồng hồ Rolex. Thời điểm này tên công ty được đổi thành Montres Rolex SA và cuối cùng là Rolex SA.

Đến tháng 12 năm 2008, sau sự ra đi đột ngột của giám đốc điều hành Patrick Heiniger, công ty Rolex đã rơi vào sự khủng hoảng với việc hao hụt đến 1 tỷ franc Thụy Sĩ (xấp xỉ 574 triệu Bảng Anh, hay 900 triệu USD) vốn đầu từ với Bernard Madoff, người quản lý quỹ đầu tư người Mỹ đã bị kết tội hoạt động gian lận khoảng 30 tỷ Bảng Anh trên toàn thế giới[9].

Đến năm 2017, thương hiệu Rolex được đánh giá là là một biểu tưởng của phong cách, của đẳng cấp và là một phụ kiện thể hiện cho sự sang trọng và xa xỉ[10][11][12][13], theo báo cáo thương hiệu năm 2017, thương hiệu Rolex được ước tính có giá trị khoảng 8.034 tỷ $[14]Sau cơn khủng hoảng Thạch Anh đến từ Nhật Bản, Rolex bắt đầu tham gia vào phát triển các đồng hồ thạch anh của riêng mình, Rolex cũng đã phát triển một số ít các phiên bản bộ máy Thạch Anh cho dòng Oyster, kỹ sư của công ty đã phát triển các trang thiết bị máy móc công nghệ để sản xuất đồng hồ Thạch Anh vào cuối thập niên 1960 và đầu thập niên 1970. Năm 1968, Rolex đã hợp tác với một tổ hợp bao gồm 16 nhà sản xuất đồng hồ Thụy Sỹ để phát triển bộ máy Thạch Anh Beta 21 được sử dụng trong phiên bản Rolex Quartz Date 5100[16] và phiên bản Omega Electroquartz. Trong khoảng 5 năm nghiên cứu, thiết kế và phát triển, hãng Rolex đã sáng tạo ra bộ máy "Clean-Slate" 5035/5055 sử dụng trong dòng đồng hồ Rolex Oysterquartz[17].Rolex SA bao gồm hai thương hiệu là Rolex và Tudor.

Thương hiệu Tudor (Montres Tudor SA) đã thiết kế, sản xuất và bán đồng hồ Tudor kể từ ngày 6 tháng 3 năm 1946. Nhà sáng lập Rolex Hans Wildorf thành lập công ty Tudor Watch Company để sản xuất những mẫu đồng hồ với mức giá tầm trung [22] với sự cho phép của hãng Rolex. Số lượng những mẫu đồng hồ Rolex được giới hạn bởi số lượng những bộ máy được sản xuất chính hãng, do đó những mẫu đồng hồ Tudor ban đầu được trang bị với các bộ máy từ các nhà sản xuất bộ máy bên ngoài[23].

Trong lịch sử, đồng hồ Tudor được sản xuất bởi Montres Tudor SA và sử dụng những bộ máy từ hãng ETA SA. Tuy nhiên, kể từ năm 2015 Tudor đã bắt đầu tự sản xuất những bộ máy chính hãng. Mẫu đầu tiên sử dụng bộ máy chính hãng là phiên bản Tudor North Flag. Sau đó các phiên bản tiếp theo là Tudor Pelagos và Tudor Heritage Black Bay cũng đã được trang bị với bộ máy In Houser[24].

Đồng hồ Tudor được phân phối trên thị trường và hầu hết các nước trên thế giới bao gồm Mỹ[25], Úc, Canada, Ấn Độ, Mexico, Nam Phi, và các quốc gia Châu Âu bao gồm Anh Quốc, Nam Á, Trung Đông và các quốc gia Nam Mỹ, đặc biệt là Brasil, Argentina và Venezuela[26].', N'20200617_niedenzu_0501.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB04', N'20200617_niedenzu_0501.jpg', N'Heritage Chronograph', CAST(N'2020-05-10T00:00:00.000' AS DateTime), N'Mrs Linh', N'Grand Seiko has earned widespread enthusiast acclaim for its dial finishing in the past several years, and its newest crop of 9F86 GMT models looks to continue its streak of superbly finished dials. The base dial texture is a fanning ridged sunburst pattern, not unlike a more refined and detailed version of the classic Seiko Presage “Cocktail Time” dial texture. This refined touch elevates the rest of the bold, aggressive design with a touch of class, keeping Grand Seiko’s premium feel intact more successfully than some of its other sports models. The blunted dauphine hands and wide faceted rectangular indices are a showcase for Grand Seikos’ polishing and brushing work, as well as a heftier counterpoint to the sharpened elements on the brand’s more dress oriented designs. Grand Seiko also adds some stealthy low-light utility into the mix, with the LumiBrite lume on the arrow GMT hand filled with a contrasting blue to stand out from the rest of the dial’s green lume. The date window at 4 o’clock sits in line with the crown and slots into the place of one of the applied indices, but the use of a white date wheel does disrupt the visual flow of the dial somewhat. With a clean and elemental dial layout, the use of color becomes transformative, and each of the three new 9F86 GMT models interprets this formula in a distinctive direction. The Grand Seiko SBGN023 140th Anniversary Limited Edition is clearly intended as the flagship of this series, and the brand reinforces this with gold accents on the two tone inner day/night bezel, gold dial text, an applied gold GS emblem, and a brushed gold GMT hand. The dial subtly harmonizes with this warm, luxurious tone with a deep brown dial finish that appears nearly black in initial images. For the SBGN019, the brand instead goes for a more straightforward sporting look with splashes of vibrant red on the inner bezel and the GMT hand. Lastly, the SBGN023 adds depth to the design with a dark oceanic blue sunburst dial finish and a lighter cyan tone for the inner bezel and GMT hand.', N'Best-Dive-Watches-For-Men-0-Hero.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB05', N'Best-Dive-Watches-For-Men-0-Hero.jpg', N'Having successfully ', CAST(N'2020-04-07T00:00:00.000' AS DateTime), N'Mrs Oang', N'Alfred Davis và anh rể là Hans Wilsdorf đã sáng lập nên "Wilsdorf and Davis" tại London nước Anh vào năm 1905 [5], là công ty tiền thân mà sau này trở thành Rolex SA. Thời điểm ban đầu "Wilsdorf and Davis" hoạt động trong lĩnh vực lắp rắp đồng hồ bằng cách nhập khẩu những bộ máy đồng hồ Thụy Sỹ từ nhà sản xuất Hermann Aegler''s đến Anh Quốc và kết hợp với những bộ vỏ đồng hồ chất lượng cao được sản xuất bởi Dennison và các nhà sản xuất khác. Những chiếc đồng hồ đầu tiên của "Wilsdorf and Davis" thường được gắn nhãn "W & D" ở mặt sau đồng hồ.

Sau một thời gian hoạt động thành công, đến năm 1908[6], Wilsdorf đã đăng ký thương hiệu "Rolex" và mở một văn phòng tại La Chaux-de-Fonds, Thụy Sỹ. Đến 15 tháng 11 năm 2015, Rolex chính thức trở thành tên công ty, và được sử dụng như một thương hiệu đồng hồ cho đến tận sau này.

Đến năm 1914, Kew Observatory đã trao cho đồng hồ Rolex một chứng chỉ về độ chính xác loại A, thường được sử dụng để cấp riêng cho các loại đồng hồ hải quân có độ chính xác Marine Chronometer[7].

Năm 1919, do chiến tranh thế giới thứ nhất và các loại thuế nhập khẩu và xuất khẩu quá cao[8] đánh vào các sản phẩm cao cấp xa xỉ sang trọng cũng như các sản phẩm được làm từ vàng và bạc, Wilsdorf đã rời nước Anh và chuyển toàn bộ công ty cũng như các cơ sở sản xuất tới Geneva Thụy Sỹ, nơi Rolex được thành lập trở thành công ty đồng hồ Rolex. Thời điểm này tên công ty được đổi thành Montres Rolex SA và cuối cùng là Rolex SA.

Đến tháng 12 năm 2008, sau sự ra đi đột ngột của giám đốc điều hành Patrick Heiniger, công ty Rolex đã rơi vào sự khủng hoảng với việc hao hụt đến 1 tỷ franc Thụy Sĩ (xấp xỉ 574 triệu Bảng Anh, hay 900 triệu USD) vốn đầu từ với Bernard Madoff, người quản lý quỹ đầu tư người Mỹ đã bị kết tội hoạt động gian lận khoảng 30 tỷ Bảng Anh trên toàn thế giới[9].

Đến năm 2017, thương hiệu Rolex được đánh giá là là một biểu tưởng của phong cách, của đẳng cấp và là một phụ kiện thể hiện cho sự sang trọng và xa xỉ[10][11][12][13], theo báo cáo thương hiệu năm 2017, thương hiệu Rolex được ước tính có giá trị khoảng 8.034 tỷ $[14]Sau cơn khủng hoảng Thạch Anh đến từ Nhật Bản, Rolex bắt đầu tham gia vào phát triển các đồng hồ thạch anh của riêng mình, Rolex cũng đã phát triển một số ít các phiên bản bộ máy Thạch Anh cho dòng Oyster, kỹ sư của công ty đã phát triển các trang thiết bị máy móc công nghệ để sản xuất đồng hồ Thạch Anh vào cuối thập niên 1960 và đầu thập niên 1970. Năm 1968, Rolex đã hợp tác với một tổ hợp bao gồm 16 nhà sản xuất đồng hồ Thụy Sỹ để phát triển bộ máy Thạch Anh Beta 21 được sử dụng trong phiên bản Rolex Quartz Date 5100[16] và phiên bản Omega Electroquartz. Trong khoảng 5 năm nghiên cứu, thiết kế và phát triển, hãng Rolex đã sáng tạo ra bộ máy "Clean-Slate" 5035/5055 sử dụng trong dòng đồng hồ Rolex Oysterquartz[17].Rolex SA bao gồm hai thương hiệu là Rolex và Tudor.

Thương hiệu Tudor (Montres Tudor SA) đã thiết kế, sản xuất và bán đồng hồ Tudor kể từ ngày 6 tháng 3 năm 1946. Nhà sáng lập Rolex Hans Wildorf thành lập công ty Tudor Watch Company để sản xuất những mẫu đồng hồ với mức giá tầm trung [22] với sự cho phép của hãng Rolex. Số lượng những mẫu đồng hồ Rolex được giới hạn bởi số lượng những bộ máy được sản xuất chính hãng, do đó những mẫu đồng hồ Tudor ban đầu được trang bị với các bộ máy từ các nhà sản xuất bộ máy bên ngoài[23].

Trong lịch sử, đồng hồ Tudor được sản xuất bởi Montres Tudor SA và sử dụng những bộ máy từ hãng ETA SA. Tuy nhiên, kể từ năm 2015 Tudor đã bắt đầu tự sản xuất những bộ máy chính hãng. Mẫu đầu tiên sử dụng bộ máy chính hãng là phiên bản Tudor North Flag. Sau đó các phiên bản tiếp theo là Tudor Pelagos và Tudor Heritage Black Bay cũng đã được trang bị với bộ máy In Houser[24].

Đồng hồ Tudor được phân phối trên thị trường và hầu hết các nước trên thế giới bao gồm Mỹ[25], Úc, Canada, Ấn Độ, Mexico, Nam Phi, và các quốc gia Châu Âu bao gồm Anh Quốc, Nam Á, Trung Đông và các quốc gia Nam Mỹ, đặc biệt là Brasil, Argentina và Venezuela[26].', N'TWCO-Air-Controller-003.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB06', N'TWCO-Air-Controller-003.jpg', N'Based in Amsterdam', CAST(N'2020-04-07T00:00:00.000' AS DateTime), N'ms viet', N'All three models in this new Grand Seiko 9F86 GMT collection are naturally powered by the brand’s in-house 9F86 quartz GMT movement. This is far from the average quartz powerplant, boasting the line’s signature backlash auto-adjust system to prevent any shuddering in the movement of the seconds hand, along with a high torque step motor for the hands. Grand Seiko claims an accuracy within -10/+10 seconds per year as well, making this exceedingly accurate even by quartz standards. The 9F86 also offers coveted “true GMT” functionality, with an independent local hour hand setting as opposed to the more common GMT hand setting function. All three models in the new Grand Seiko 9F86 GMT collection are paired with the brand’s three link oyster style bracelet in stainless steel.', N'1.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB07', N'1.jpg', N'Compagnie des Mon ', CAST(N'2020-04-07T00:00:00.000' AS DateTime), N'ms viet', N'If you’re judging a watch on a spec to dollar ratio, alone, the Zelos Hammerhead V3 is hard to beat, but what sets the Hammerhead 3 apart is Zelos’s unique and distinctive design language and quality of execution. You won’t mistake the Hammerhead V3 for anything else on the market, and the wide range of dial options means there’s a colorway to match every taste. The Zelos Hammerhead V3 starts at $349 USD — more information can be found on the brand’s website.

Sponsored Posts are a form of advertising that allows sponsors to share useful news, messages, and offers to aBlogtoWatch readers in a way traditional display advertising is often not best suited to. All Sponsored Posts are subject to editorial guidelines with the intent that they offer readers useful news, promotions, or stories. The viewpoints and opinions expressed in Sponsored Posts are those of the advertiser and not necessarily those of aBlogtoWatch or its writers.', N'Dive-Photoshoot-1.jpg')
INSERT [dbo].[Blog] ([MaBlog], [AnhBlog], [TieuDe], [ThoiGian], [NgPost], [NoiDung], [AnhBlog_nho]) VALUES (N'MB08', N'1.jpg', N'The reintroduction', CAST(N'2020-04-07T00:00:00.000' AS DateTime), N'ms viet', N'Alfred Davis và anh rể là Hans Wilsdorf đã sáng lập nên "Wilsdorf and Davis" tại London nước Anh vào năm 1905 [5], là công ty tiền thân mà sau này trở thành Rolex SA. Thời điểm ban đầu "Wilsdorf and Davis" hoạt động trong lĩnh vực lắp rắp đồng hồ bằng cách nhập khẩu những bộ máy đồng hồ Thụy Sỹ từ nhà sản xuất Hermann Aegler''s đến Anh Quốc và kết hợp với những bộ vỏ đồng hồ chất lượng cao được sản xuất bởi Dennison và các nhà sản xuất khác. Những chiếc đồng hồ đầu tiên của "Wilsdorf and Davis" thường được gắn nhãn "W & D" ở mặt sau đồng hồ.

Sau một thời gian hoạt động thành công, đến năm 1908[6], Wilsdorf đã đăng ký thương hiệu "Rolex" và mở một văn phòng tại La Chaux-de-Fonds, Thụy Sỹ. Đến 15 tháng 11 năm 2015, Rolex chính thức trở thành tên công ty, và được sử dụng như một thương hiệu đồng hồ cho đến tận sau này.

Đến năm 1914, Kew Observatory đã trao cho đồng hồ Rolex một chứng chỉ về độ chính xác loại A, thường được sử dụng để cấp riêng cho các loại đồng hồ hải quân có độ chính xác Marine Chronometer[7].

Năm 1919, do chiến tranh thế giới thứ nhất và các loại thuế nhập khẩu và xuất khẩu quá cao[8] đánh vào các sản phẩm cao cấp xa xỉ sang trọng cũng như các sản phẩm được làm từ vàng và bạc, Wilsdorf đã rời nước Anh và chuyển toàn bộ công ty cũng như các cơ sở sản xuất tới Geneva Thụy Sỹ, nơi Rolex được thành lập trở thành công ty đồng hồ Rolex. Thời điểm này tên công ty được đổi thành Montres Rolex SA và cuối cùng là Rolex SA.

Đến tháng 12 năm 2008, sau sự ra đi đột ngột của giám đốc điều hành Patrick Heiniger, công ty Rolex đã rơi vào sự khủng hoảng với việc hao hụt đến 1 tỷ franc Thụy Sĩ (xấp xỉ 574 triệu Bảng Anh, hay 900 triệu USD) vốn đầu từ với Bernard Madoff, người quản lý quỹ đầu tư người Mỹ đã bị kết tội hoạt động gian lận khoảng 30 tỷ Bảng Anh trên toàn thế giới[9].

Đến năm 2017, thương hiệu Rolex được đánh giá là là một biểu tưởng của phong cách, của đẳng cấp và là một phụ kiện thể hiện cho sự sang trọng và xa xỉ[10][11][12][13], theo báo cáo thương hiệu năm 2017, thương hiệu Rolex được ước tính có giá trị khoảng 8.034 tỷ $[14]Sau cơn khủng hoảng Thạch Anh đến từ Nhật Bản, Rolex bắt đầu tham gia vào phát triển các đồng hồ thạch anh của riêng mình, Rolex cũng đã phát triển một số ít các phiên bản bộ máy Thạch Anh cho dòng Oyster, kỹ sư của công ty đã phát triển các trang thiết bị máy móc công nghệ để sản xuất đồng hồ Thạch Anh vào cuối thập niên 1960 và đầu thập niên 1970. Năm 1968, Rolex đã hợp tác với một tổ hợp bao gồm 16 nhà sản xuất đồng hồ Thụy Sỹ để phát triển bộ máy Thạch Anh Beta 21 được sử dụng trong phiên bản Rolex Quartz Date 5100[16] và phiên bản Omega Electroquartz. Trong khoảng 5 năm nghiên cứu, thiết kế và phát triển, hãng Rolex đã sáng tạo ra bộ máy "Clean-Slate" 5035/5055 sử dụng trong dòng đồng hồ Rolex Oysterquartz[17].Rolex SA bao gồm hai thương hiệu là Rolex và Tudor.

Thương hiệu Tudor (Montres Tudor SA) đã thiết kế, sản xuất và bán đồng hồ Tudor kể từ ngày 6 tháng 3 năm 1946. Nhà sáng lập Rolex Hans Wildorf thành lập công ty Tudor Watch Company để sản xuất những mẫu đồng hồ với mức giá tầm trung [22] với sự cho phép của hãng Rolex. Số lượng những mẫu đồng hồ Rolex được giới hạn bởi số lượng những bộ máy được sản xuất chính hãng, do đó những mẫu đồng hồ Tudor ban đầu được trang bị với các bộ máy từ các nhà sản xuất bộ máy bên ngoài[23].

Trong lịch sử, đồng hồ Tudor được sản xuất bởi Montres Tudor SA và sử dụng những bộ máy từ hãng ETA SA. Tuy nhiên, kể từ năm 2015 Tudor đã bắt đầu tự sản xuất những bộ máy chính hãng. Mẫu đầu tiên sử dụng bộ máy chính hãng là phiên bản Tudor North Flag. Sau đó các phiên bản tiếp theo là Tudor Pelagos và Tudor Heritage Black Bay cũng đã được trang bị với bộ máy In Houser[24].

Đồng hồ Tudor được phân phối trên thị trường và hầu hết các nước trên thế giới bao gồm Mỹ[25], Úc, Canada, Ấn Độ, Mexico, Nam Phi, và các quốc gia Châu Âu bao gồm Anh Quốc, Nam Á, Trung Đông và các quốc gia Nam Mỹ, đặc biệt là Brasil, Argentina và Venezuela[26].', N'Dive-Photoshoot-1.jpg')
GO
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a1', N'E-3420.152.22.18.32', N'Sonata', N'Italy', N'nu        ', N'p-1.png', 120, N'Kính sapphire', 40, N'Thép không gỉ mạ PVD', 20, N'Thép không gỉ mạ vàng PVD', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a10', N'DM15145IG', N'Fossil', N'Italy', N'nu        ', N'p-3.png', 399, N'Kính sapphire', 22, N'Hợp kim mạ PVD , đính đá swarovsky', 8, N'Hợp kim mạ PVD , đính đá swarovsky', 25, 5, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a11', N'DM61195IG-B', N'Fossil', N'Italy', N'nu        ', N's-3.jpg', 499, N'Sapphire', 28, N'Dây da', 12, N'Hợp kim mạ PVD rose gold , đính đá swarovsky', 28, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a12', N'DD6009C', N'Sonata', N'Italy', N'nam       ', N'p-2.png', 799, N'Kính sapphire', 34, N'Hợp kim mạ PVD , đính đá swarovsky', 22, N'Thép không gỉ (mạ Demi PVD )', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a13', N'DD6014B', N'Sonata', N'Italy', N'nam       ', N's-1.jpg', 499, N'Sapphire', 30, N'Stainless Steel', 20, N'Thép không gỉ mạ vàng PVD', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a14', N'AG-L5039Z 2TRG-W', N'Sonata', N'Italy', N'nu        ', N'p-5.png', 699, N'Sapphire', 32, N'Stainless Steel', 22, N'Thép không gỉ mạ vàng PVD', 34, 4, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a15', N'AG-L5021 G-MB', N'Casio', N'France', N'nam       ', N'p-6.png', 100, N'Sapphire', 34, N'Thép không gỉ mạ PVD', 18, N'Thép không gỉ mạ PVD', 32, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a16', N'AG-L9023 S-BK', N'Casio', N'Italy', N'nu        ', N'p-7.png', 57, N'Sapphire', 37, N'Thép không gỉ', 20, N'Thép không gỉ', 43, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a17', N'AG-G9001 2TG-W', N'Casio', N'Italy', N'nam       ', N'p-8.png', 43, N'Sapphire', 41.3, N'Thép không gỉ mạ Demi PVD', 21, N'Thép không gỉ mạ Demi PVD', 65, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a18', N'AG-G100 RG-WRG+AG-L100 RG-MP', N'Casio', N'France', N'nu        ', N's-1.jpg', 432, N'Sapphire', 43.5, N'Dây da', 22, N'Thép không gỉ mạ PVD  rose gold', 34, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a19', N'AG-G1031 G-WG + AG-L1032 G-WG', N'Casio', N'Italy', N'nam       ', N's-2.jpg', 662, N'Sapphire', 40, N'Stainless Steel', 22, N'Thép không gỉ mạ vàng PVD', 55, 5, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a2', N'E-3420.156.22.20.15', N'Titan', N'Italy', N'nu        ', N'p-2.png', 110, N'Kính sapphire', 40, N'Dây da', 20, N'Thép không gỉ mạ vàng PVD', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a20', N'JL-42-6H', N'Fastrack', N'Italy', N'nu        ', N's-3.jpg', 553, N'Hardened Crystex Crystal', 42, N'Thép không gỉ mạ Demi PVD', 22, N'Thép không gỉ mạ Demi PVD', 42, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a21', N'AAS-29038.45.27MB', N'Fastrack', N'Germany', N'nam       ', N'p-1.png   ', 324, N'Sapphire', 34, N'Thép không gỉ mạ vàng PVD', 20, N'Thép không gỉ mạ vàng PVD', 34, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a22', N'JL-1-1950A', N'Fastrack', N'USA', N'nam       ', N'p-2.png', 864, N'hardened crystex crystal (Kính cứng )', 38, N'Dây da', 19, N'Stainless Steel', 38, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a23', N'JL-42-3F', N'Fastrack', N'VietNam', N'nu        ', N's-1.jpg', 566, N'hardened crystex crystal (Kính cứng )', 34, N'Thép không gỉ mạ PVD + ceramic', 17, N'Thép không gỉ mạ PVD', 34, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a24', N'JL-1-1842.1F', N'Fastrack', N'VietNam', N'nu        ', N'p-7.png', 342, N'hardened crystex crystal (Kính cứng )', 32, N'Thép không gỉ', 16, N'Stainless Steel', 32, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a25', N'JL-1-1904H+JL-1-1905H', N'Fastrack', N'VietNam', N'nam       ', N'p-6.png', 773, N'hardened crystex crystal (Kính cứng )', 30, N'Thép không rỉ', 21, N'Thép không gỉ (mạ Demi PVD )', 37, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a26', N'JL-1-1769M+JL-1-1763F', N'Fastrack', N'Italy', N'nu        ', N'p-2.png', 547, N'hardened crystex crystal (Kính cứng )', 39, N'Thép không gỉ mạ PVD', 20, N'Thép không gỉ mạ PVD', 39, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a27', N'AS-50354.45.21', N'Omax', N'France', N'nam       ', N's-1.jpg', 967, N'Sapphire', 28.5, N'Thép không gỉ mạ PVD', 22, N'Thép không gỉ mạ vàng PVD', 28.5, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a28', N'ES-7000.701.22.16.26', N'Omax', N'Japan', N'nam       ', N's-1.jpg', 67, N'Kính sapphire', 41.5, N'Dây da', 20, N'Thép không gỉ mạ vàng PVD', 41.5, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a29', N'E-7000.701.22.15.25', N'Omax', N'Switzerland', N'nu        ', N'p-5.png', 654, N'Kính sapphire', 41.5, N'Dây da', 20, N'Thép không gỉ mạ vàng PVD', 41.5, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a3', N'AT-50354.45.21', N'Casio', N'Italy', N'nam       ', N'p-3.png', 499, N'Sapphire', 42, N'Dây da', 22, N'Thép  không gỉ mạ PVD', 42, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a30', N'ESS-8000.700.22.88.32', N'Omax', N'Switzerland', N'nu        ', N's-2.jpg', 555, N'Kính sapphire', 34, N'Thép không gỉ mạ PVD', 16, N'Thép không gỉ mạ vàng PVD', 34, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a4', N'AT-60347.43.11', N'Omax', N'Italy', N'nam       ', N'p-4.png', 350, N'Sapphire', 40, N'Thép không gỉ (mạ Demi PVD )', 20, N'Thép không gỉ (mạ Demi PVD )', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a5', N'AT-64352.41.61', N'Sports', N'Italy', N'nam       ', N'p-5.png', 177, N'Sapphire', 42, N'Dây da', 22, N'Thép không gỉ', 42, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a6', N'AT-63760.45.21', N'Fastrack', N'Italy', N'nu        ', N'p-6.png', 850, N'Sapphire', 42, N'Dây da', 22, N'Thép không gỉ mạ vàng PVD', 42, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a7', N'AT-63760.45.21', N'Fossil', N'Italy', N'nu        ', N'p-7.png', 788, N'Kính sapphire', 40, N'Thép không gỉ ( mạ Demi PVD )', 9.8, N'Thép không gỉ (mạ Demi PVD )', 40, 10, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a8', N'D DM5308B5IG', N'Diesel', N'Italy', N'nam       ', N'p-8.png', 146, N'Kính sapphire', 24, N'Hợp kim mạ PVD , đính đá swarovsky', 8, N'Hợp kim mạ PVD , đính đá swarovsky', 25, 5, 1)
INSERT [dbo].[ChiTietDongHo] ([MaSP], [TenSP], [ThuongHieu], [XuatXu], [GioiTinh], [Anh], [Gia], [chatLieuMat], [duongKinhMat], [chatLieuDay], [sizeDay], [chatLieuVo], [duongKinhVo], [timeBaoHanh], [active]) VALUES (N'a9', N'DM38445IG', N'Fossil', N'Switzerland', N'nam       ', N's-1.jpg', 599, N'Sapphire', 34, N'Thép không gỉ mạ PVD', 20, N'Thép không gỉ mạ vàng PVD', 34, 5, 1)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaSP], [MaHD], [SoLuong], [TongTien]) VALUES (N'a1', 1, 3, 402332)
INSERT [dbo].[ChiTietHoaDon] ([MaSP], [MaHD], [SoLuong], [TongTien]) VALUES (N'a11', 2, 1, 499)
INSERT [dbo].[ChiTietHoaDon] ([MaSP], [MaHD], [SoLuong], [TongTien]) VALUES (N'a11', 3, 1, 499)
GO
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'Atrino', N'Hà Nội', N'077777777')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'DatVinhQuang', N'Cầu Giấy', N'0386259007')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'HANSAE ', N'Hà Nội', N'033222232')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'May10', N'Gia Lâm', N'099999999')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'Owen', N'Hải Phòng', N'033333333')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'Shein', N'Đống Đa', N'0322988444')
INSERT [dbo].[CongTy] ([TenCty], [DiaChiCty], [SdtCty]) VALUES (N'VietTien', N'Bắc Giang', N'099999999')
GO
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00032020', 15000, 50, N'Bùi Quang Hậu', 34, 200000, N'Quần Short ', 60)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00042019', 98980, 100, N'Vương Toàn Đạt', 40, 200000, N'Áo Jean', 6)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00042020', 12100, 70, N'Nguyễn Trung Giang', 24, 200000, N'Quần Short ', 45)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00052019', 28968, 70, N'Bùi Quang Hậu', 20, 200000, N'Quần Jean', 10)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00052020', 30000, 100, N'Bùi Thị Vân', 58, 200000, N'Váy Đen', 8)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00062019', 32100, 30, N'Nguyễn Trung Giang', 9, 200000, N'Quần Short ', 40)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00062020', 32100, 60, N'Nguyễn Thị Bông', 45, 200000, N'Áo Jean', 9)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00072019', 40975, 60, N'Bùi Thị Vân', 16, 200000, N'Áo Jean', 23)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00072020', 12000, 150, N'Lại Thị Phương', 60, 200000, N'Quần Short ', 12)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00082019', 30000, 40, N'Nguyễn Thị Bông', 35, 200000, N'Áo Ba Lỗ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00082020', 20000, 70, N'Nguyễn Sỹ Thể', 4, 200000, N'Sơ Mi', 3)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00092019', 20000, 50, N'Lại Thị Phương', 24, 200000, N'Quần Jean', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00092020', 18000, 80, N'Nguyễn Văn Bình', 6, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00102019', 90000, 20, N'Nguyễn Sỹ Thể', 18, 200000, N'Áo Ba Lỗ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00102020', 26000, 85, N'Vương Toàn Đạt', 3, 200000, N'Áo Jean', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00112019', 10000, 80, N'Nguyễn Văn Bình', 49, 200000, N'Áo Phông', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00112020', 21000, 100, N'Bùi Quang Hậu', 7, 200000, N'ComBo Quần+Áo', 24)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00112021', 21000, 100, N'Bùi Quang Hậu', 7, 200000, N'ComBo Quần+Áo', 30)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00112028', 21000, 45, N'Bùi Quang Hậu', 20, 200000, N'Áo Jean', 30)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00122019', 15000, 90, N'Vương Toàn Đạt', 56, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'00122020', 34000, 115, N'Nguyễn Trung Giang', 3, 200000, N'ComBo Quần+Áo', 3)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'01012019', 56000, 55, N'Nguyễn Thị Bông', 10, 300000, N'Váy Đen', 10)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'01012020', 33000, 10, N'Bùi Quang Hậu', 5, 200000, N'ComBo Quần+Áo', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'01022019', 64500, 10, N'Vương Toàn Đạt', 5, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'01022020', 83400, 50, N'Lại Thị Phương', 34, 200000, N'Quần beijing', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'01032019', 30000, 90, N'Nguyễn Thị Bông', 30, 200000, N'Quần beijing', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'02012019', 72400, 35, N'Lại Thị Phương', 15, 200000, N'Quần Short ', 20)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'02012020', 62100, 35, N'Nguyễn Trung Giang', 37, 200000, N'Áo Jean', 20)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'02022019', 45000, 70, N'Bùi Quang Hậu', 50, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'02022020', 56000, 70, N'Nguyễn Sỹ Thể', 23, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'02032019', 30000, 40, N'Lại Thị Phương', 20, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0231312', 34324, 55, N'Vương Toàn Đạt', 36, 865713, N'Quần Short ', 10)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0231317', 34324, 37, N'Vương Toàn Đạt', 18, 865713, N'Quần beijing', 30)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0231318', 34324, 77, N'Vương Toàn Đạt', 32, 865713, N'Quần Short ', 28)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03012019', 95760, 20, N'Nguyễn Sỹ Thể', 25, 400000, N'Quần Jean', 30)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03012020', 71000, 55, N'Bùi Thị Vân', 32, 400000, N'Váy Đen', 30)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03022019', 33000, 30, N'Nguyễn Trung Giang', 15, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03022020', 42400, 30, N'Nguyễn Văn Bình', 32, 200000, N'ComBo Quần+Áo', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03032019', 30000, 60, N'Nguyễn Sỹ Thể', 50, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'03124344', 34324, 66, N'Nguyễn Trung Giang', 22, 432434, N'Quần beijing', 27)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0321443', 84700, 13, N'Vương Toàn Đạt', 6, 664343, N'Áo Jean', 8)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0324344', 32434, 55, N'Bùi Thị Vân', 22, 545355, N'Quần Short ', 11)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'04012019', 37680, 60, N'Nguyễn Văn Bình', 40, 200000, N'Quần Jean', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'04012020', 94600, 40, N'Nguyễn Thị Bông', 30, 200000, N'Quần Short ', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'04022019', 84700, 50, N'Bùi Thị Vân', 10, 200000, N'Quần Jean', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'04022020', 39000, 45, N'Vương Toàn Đạt', 15, 200000, N'Quần Short ', 20)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'04032019', 30000, 30, N'Nguyễn Văn Bình', 20, 200000, N'Váy Đen', 5)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0523123', 43423, 36, N'Vương Toàn Đạt', 33, 432434, N'Quần Jean', 33)
INSERT [dbo].[DoanhThu] ([MaNgayThang], [DoanhThu], [TongSLBanDc], [TenNhanVien], [SoDonBan], [DoanhThuNV], [TenSpBanChay], [SLBan]) VALUES (N'0988443', 14234, 66, N'Lại Thị Phương', 7, 324324, N'Váy Đen', 10)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [MaKH], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (1, CAST(N'2020-02-02T00:00:00.000' AS DateTime), N'KH03', N'Vương Toàn Đạt', N'02343243', N'Hà Nội', N'vuongdat@gmail.com', 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [MaKH], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (2, CAST(N'2021-05-10T16:42:15.683' AS DateTime), N'KH04', N'Vương Đạt', N'1658421958', N'gg', N'vuongdatpro@gmail.com', 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [MaKH], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (3, CAST(N'2021-05-10T16:44:05.450' AS DateTime), NULL, N'sadasdasdasd', N'1658421958', N'eqweqwe', N'vuongdatpro@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (1, N'phạm thị quỳnh', CAST(N'1990-07-21' AS Date), N'Nam', N'avatar1.jpg', N'thanh hóa', N'01234567891', N'qwerqwr@àlkajf', N'admin', N'admin')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (2, N'Trần Thị Hằng', CAST(N'2993-11-28' AS Date), N'Nữ', N'avartar2.jpg', N'thanh trì', N'01234567899', N'chi@gmai.com', N'coadmin', N'ffasd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (3, N'Võ Trang Nhung', CAST(N'2993-11-28' AS Date), N'Nữ', N'avartar3.jpg', N'66/3C QUANG TRUNG STREET, WARD 12', N'098667809', N'adkweeoi@gmail.com', N'cakecoca', N'safsa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (4, N'minh khang', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar5.jpg', N'thanh hóa', N'02342323435', N'ksoiwer@aldk.com', N'aweddraft', N'ewqe')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (5, N'Phùng Bá Quang', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar6.jpg', N'Km33 - 1564A1 Hamlet An Binh, Trang Bang -', N'0123456789', N'alkfiwe@gmail.com', N'canhgiadinh', N'fasd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (6, N'Đinh mạnh nam', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar7.jpg', N'130 Khanh Hoi, P6, District 4', N'0123456789', N'ch@gmail.com', N'connammuoitieu', N'qweqw')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (8, N'Hà Chí Anh', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar9.jpg', N'Thanh Tung Commune, Dam Doi District', N'09789098765', N'chadwe59@gmail.com', N'inicalryde', N'asdas')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (9, N'Trần Hữu Trác', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar9.jpg', N' 114 Nguyen Hue Street, Quy Nhon City', N'09789098765', N'adklwe@gmail.com', N'gleyheston', N'zxczxc')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (10, N'nguyễn minh phương', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar10.jpg', N'11 Mai Hac De Street, Vinh city', N'36 450 944', N'weirosd3@gmail.com', N'edyerypona', N'qwe')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (11, N'minh phương', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar12.jpg', N'235-237 Hoang Hoa Tham', N'09789098765', N'chtadf9@gmail.com', N'adz', N'xzczxa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (12, N'Phạm Trung', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar9.jpg', N'437 B Pham Van Chi, Ward 08, Dist.6', N'09789098765', N'ch99@gmail.com', N'phamtrung', N'weqeeqw')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (13, N'Tiêu Huy Khiêm', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar13.jpg', N'437 B Pham Van Chi, Ward 08, Dist.6', N'02345489687', N'anhnguyet@gmail.com', N'thao thao', N'sadasd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (14, N'Võ Tân Bình', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar14.jpg', N'351B, Commune 1, Ward 1', N'(08) 38966091', N'anhnguyet@gmail.com', N'giddyenhance', N'qweqw')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (15, N'Bành Trung Nhân', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar15.jpg', N'57 Dao Duy Anh, Ward 9', N'02345489687', N'anhnguyet@gmail.com', N'pridefuloriginally', N'sadasd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (17, N'Lưu Nguyên Hạnh', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar16.jpg', N'12/14C Nam Thien, Tang Nhon Phu A Ward, Dist.9', N'38540660', N'anhnguyet@gmail.com', N'binhdien', N'qweqw')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (18, N'Nguyễn Nhật Huy', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar17.jpg', N'No.35-Km12 Ngoc Hoi Street', N'02345489687', N'anhnguyet@gmail.com', N'hanguyen', N'asdas')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (19, N'Châu Tạ Hiền', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar18.jpg', N'76 - 78 - 80 Hai Thuong Lan Ong, F10, District 5', N'02345489687', N'anhnguyet@gmail.com', N'baphong', N'qweqwe')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (20, N'Phan Phú Hùng', CAST(N'2993-11-28' AS Date), N'Nam', N'avatar19.jpg', N'National Highway 13, Hiep Binh Phuoc Ward, Thu Duc District', N'36 450 944', N'anhnguyet@gmail.com', N'orangexanh', N'saddasd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [SoDT], [Email], [TenTK], [MatKhau]) VALUES (21, N'Ngư Thành Công', CAST(N'2993-11-28' AS Date), N'Nữ', N'avatar20.jpg', N'Duc Hoa 1 Industrial Park Hamlet 5', N'02345489687', N'anhnguyet@gmail.com', N'traicayt', N'ewew')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (1, N'Vương Toàn Đạt', N'09999999', N'Hà Nội', 99999)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (2, N'Trần Minh Quang', N'08989899', N'Nam Định', 40000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (3, N'Đồng Văn Vinh', N'07734552', N'Bắc Giang', 40000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (4, N'Nguyên Văn A', N'01234155', N'Ninh Bình ', 35000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (5, N'Kiều Văn Cường', N'09546525', N'Thanh Hóa', 37000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (6, N'Nguyễn Ngọc Phong ', N'03542544', N'Bắc Giang', 40000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (7, N'Nguyen Van A', N'159357258', N'Ha Noi', 555555)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [SoDT], [DiaChi], [Luong]) VALUES (8, N'Nguyen Thi Thao', N'159357258', N'Ha Noi', 3335555)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Casio', N'CASIO')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Diesel', N'DIESEL')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Fastrack', N'FASTRACK')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Fossil', N'FOSSIL')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Omax', N'OMAX')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Sonata', N'SONATA')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Sports', N'SPORTS')
INSERT [dbo].[tThuongHieu] ([ThuongHieu], [TenThuongHieu]) VALUES (N'Titan', N'TITAN')
GO
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'France', N'Pháp')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'Germany', N'Đức')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'Italy', N'Ý')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'Japan', N'Nhật Bản')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'Switzerland', N'Thụy Sĩ')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'USA', N'Mỹ')
INSERT [dbo].[tXuatXu] ([XuatXu], [TenXuatXu]) VALUES (N'VietNam', N'Việt Nam')
GO
ALTER TABLE [dbo].[ChiTietDongHo]  WITH CHECK ADD  CONSTRAINT [fk_htk_ThuongHieu] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[tThuongHieu] ([ThuongHieu])
GO
ALTER TABLE [dbo].[ChiTietDongHo] CHECK CONSTRAINT [fk_htk_ThuongHieu]
GO
ALTER TABLE [dbo].[ChiTietDongHo]  WITH CHECK ADD  CONSTRAINT [fk_htk_XuatXu] FOREIGN KEY([XuatXu])
REFERENCES [dbo].[tXuatXu] ([XuatXu])
GO
ALTER TABLE [dbo].[ChiTietDongHo] CHECK CONSTRAINT [fk_htk_XuatXu]
GO
