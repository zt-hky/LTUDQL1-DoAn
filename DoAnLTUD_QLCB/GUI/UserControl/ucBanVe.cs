using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using DTO;
namespace GUI
{
    public partial class ucBanVe : UserControl
    {
        private static ucBanVe _instance;
        public static ucBanVe Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucBanVe();
                return _instance;
            }
        }
        public ucBanVe()
        {
            InitializeComponent();
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void txtBoxMaDatCho_TextChanged(object sender, EventArgs e)
        {
            txtBoxMaKH.Clear();
            txtBoxHoTen.Clear();
            txtBoxSoDienThoai.Clear();
            txtBoxCMND.Clear();
            txtBoxGiaTien.Clear();
            txtBoxGioKhoiHanh.Clear();
            txtBoxMaCB.Clear();
            txtBoxSBDen.Clear();
            txtBoxSBDi.Clear();
            int maDat = 0;
            if(!int.TryParse(txtBoxMaDatCho.Text.ToString(),out maDat))
            {
                MessageBox.Show("Mã đặt chổ không hợp lệ! Vui lòng nhập số!");
            }
            ChuyenBay_KhachHang_MaVe res = ChuyenBay_KhachHang_MaVeBUS.Instance.ThongTinDatCho(maDat);
            if (res == null)
            {
                // MessageBox.Show("CMND không có trong danh sách, vui lòng trở lại tra cứu khách hàng!", "Thông báo");
            }
            else
            {
                txtBoxHoTen.Text = res.TenKH;
                txtBoxMaKH.Text = res.MaKH.ToString();
                txtBoxSoDienThoai.Text = res.DienThoai;
                txtBoxCMND.Text = res.CMND;
                txtBoxMaCB.Text = res.MaCB;
                txtBoxSBDen.Text = res.SBDen;
                txtBoxSBDi.Text = res.SBDi;
                txtBoxGioKhoiHanh.Text = res.NgayGio.ToString();
                txtBoxGiaTien.Text = res.GiaVe.ToString();
                txtBoxHangVe.Text = res.HangVe.ToString();
            }
        }

        private void btnBanVe_Click(object sender, EventArgs e)
        {
            if (txtBoxMaDatCho.Text =="")
            {
                MessageBox.Show("Không được để dữ liệu trống!", "Thông báo");
            }
            else
            {
                int maDatCho = 0;
                if(!int.TryParse(txtBoxMaDatCho.Text,out maDatCho))
                {
                    MessageBox.Show("Vui lòng nhập lại mã đặt chổ", "Thông báo");
                }
                else
                {
                    int res = VeChuyenBayBUS.Instance.CapNhatLoaiVe_BanVe(maDatCho);
                    if (res == 0)
                    {
                        MessageBox.Show("Xin lỗi không thể đặt vé! Xin hãy kiểm tra lại dữ liệu!", "Thông báo");
                    }
                    else
                    {
                        MessageBox.Show("Mua vé thành công!", "Thông báo");
                    }
                }
                
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {

        }
    }
}
