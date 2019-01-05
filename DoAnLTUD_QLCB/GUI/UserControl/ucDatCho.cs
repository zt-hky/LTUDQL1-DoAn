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
    public partial class ucDatCho : UserControl
    {
        private static ucDatCho _instance;
        public static ucDatCho Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucDatCho();
                return _instance;
            }
        }
        public ucDatCho()
        {
            InitializeComponent();
           
            var dsChuyenBay = ChuyenBayBUS.Instance.DatCho_DanhSachChuyenBay();
            cbMaCB.DataSource = dsChuyenBay;
            cbMaCB.DisplayMember = "MaCB";
            cbMaCB.ValueMember ="MaCB";
           
        }

        private void cbMaCB_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChuyenBay cb = ChuyenBayBUS.Instance.TimKiemChuyenBay(cbMaCB.SelectedValue.ToString());
            txtBoxSBDi.Text = cb.SBDi;
            txtBoxSBDen.Text = cb.SBDen;
            dateTimePickerNgayGioDi.Text = cb.NgayGio.ToString();
        }

        private void txtBoxCMND_TextChanged(object sender, EventArgs e)
        {
           
            DataTable res = KhachHangBUS.Instance.TimKiemKhachHang(txtBoxCMND.Text.ToString());
            if(res.Rows.Count==0)
            {
                MessageBox.Show("CMND không có trong danh sách, vui lòng trở lại tra cứu khách hàng!", "Thông báo");
            }
            else
            {
                KhachHang kh = new KhachHang(res.Rows[0]);
                txtBoxHoTen.Text = kh.TenKH;
                txtBoxMaKH.Text = kh.MaKH.ToString();
                txtBoxSoDienThoai.Text = kh.DienThoai;
            }
        }
    }
}
