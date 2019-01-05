using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO;
using BUS;
namespace GUI
{
    public partial class FrmThemKhachHang : Form
    {
        public FrmThemKhachHang()
        {
            InitializeComponent();
        }
        public FrmThemKhachHang(string CMND)
        {
            InitializeComponent();
            KhachHang kh = null;
            DataTable dt = KhachHangBUS.Instance.TimKiemKhachHang(CMND);
            if(dt.Rows.Count ==0)
            {
                MessageBox.Show("Không tìm thấy CMND");
            }
            else
            {
                kh = new KhachHang(dt.Rows[0]);
                txtBoxCMND.Text = kh.CMND;
                txtBoxMaKH.Text = kh.MaKH.ToString();
            }  
        }
        private void btnInsert_Click(object sender, EventArgs e)
        {
            KhachHang kh = new KhachHang();
            kh.CMND = txtBoxCMND.Text;
            kh.DienThoai = txtBoxDienThoai.Text;
            kh.TenKH = txtBoxHoTen.Text;
            kh.MaKH = int.Parse(txtBoxMaKH.Text);

           int res= KhachHangBUS.Instance.CapNhatKhachHang(kh);
            if(res ==0)
            {
                MessageBox.Show("Cập nhật không thành công!");
            }
            else
            {
                MessageBox.Show("Cập nhật thành công!");
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            KhachHang kh = new KhachHang();
            kh.CMND = txtBoxCMND.Text;
            kh.DienThoai = txtBoxDienThoai.Text;
            kh.TenKH = txtBoxHoTen.Text;
            kh.MaKH = int.Parse(txtBoxMaKH.Text);

            int res = KhachHangBUS.Instance.CapNhatKhachHang(kh);
            if (res == 0)
            {
                MessageBox.Show("Cập nhật không thành công!");
            }
            else
            {
                MessageBox.Show("Cập nhật thành công!");
            }
        }
    }
}
