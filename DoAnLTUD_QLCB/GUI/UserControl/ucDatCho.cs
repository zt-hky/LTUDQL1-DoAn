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
            List<int> ds = new List<int>();
            ds.Add(1);
            ds.Add(2);
            cbHangVe.DataSource = ds;
        }

        private void cbMaCB_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChuyenBay cb = ChuyenBayBUS.Instance.TimKiemChuyenBay(cbMaCB.SelectedValue.ToString());
            if(cb !=null)
            {
                txtBoxSBDi.Text = cb.SBDi;
                txtBoxSBDen.Text = cb.SBDen;
                dateTimePickerNgayGioDi.Text = cb.NgayGio.ToString();
            }
           
        }

        private void txtBoxCMND_TextChanged(object sender, EventArgs e)
        {
            txtBoxMaKH.Clear();
            txtBoxHoTen.Clear();
            txtBoxSoDienThoai.Clear();
            DataTable res = KhachHangBUS.Instance.TimKiemKhachHang(txtBoxCMND.Text.ToString());
            if(res.Rows.Count==0)
            {
              // MessageBox.Show("CMND không có trong danh sách, vui lòng trở lại tra cứu khách hàng!", "Thông báo");
            }
            else
            {
                KhachHang kh = new KhachHang(res.Rows[0]);
                txtBoxHoTen.Text = kh.TenKH;
                txtBoxMaKH.Text = kh.MaKH.ToString();
                txtBoxSoDienThoai.Text = kh.DienThoai;
            }
        }

        private void btnDatCho_Click(object sender, EventArgs e)
        {
            if(cbHangVe.SelectedValue ==null || txtBoxCMND.Text==""||cbMaCB.SelectedValue ==null)
            {
                MessageBox.Show("Không được để dữ liệu trống!", "Thông báo");
            }
            else
            {
                VeChuyenBay ve = new VeChuyenBay();
                ve.MaCB = cbMaCB.Text;
                ve.MaKH = int.Parse(txtBoxMaKH.Text);
                ve.GheHang = int.Parse(cbHangVe.Text);
                ve.NgayDat = DateTime.Parse(dateTimePickerNgayDat.Value.ToString());
                ve.GiaVe = int.Parse(txtBoxGiaTien.Text);
                int res = VeChuyenBayBUS.Instance.ThemVe_DatCho(ve);
                if (res == 0)
                {
                    MessageBox.Show("Xin lỗi không thể đặt vé! Xin hãy kiểm tra lại dữ liệu!", "Thông báo");
                }
                else
                {
                    int maVe = VeChuyenBayBUS.Instance.TimKiemMaDatCho(int.Parse(txtBoxMaKH.Text), cbMaCB.Text);
                    if(maVe ==0)
                    {
                        MessageBox.Show("Xin lỗi không thể đặt vé! Xin hãy kiểm tra lại dữ liệu!", "Thông báo");
                    }
                    else
                    {
                        MessageBox.Show("Mã đặt chỗ của bạn là : "+maVe);
                    }
                   
                }
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {

            txtBoxMaKH.Clear();
            txtBoxHoTen.Clear();
            txtBoxSoDienThoai.Clear();
        }

        private void cbHangVe_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbHangVe.SelectedValue != null)
            {
                VeChuyenBay ve = new VeChuyenBay();
                ve.MaCB = cbMaCB.Text;
                //ve.MaKH = int.Parse(txtBoxMaKH.Text);
                ve.GheHang = int.Parse(cbHangVe.Text);
                int Gia = VeChuyenBayBUS.Instance.XemGiaVe_DatCho(ve);
                txtBoxGiaTien.Text = Gia.ToString();
            }
        }
    }
}
