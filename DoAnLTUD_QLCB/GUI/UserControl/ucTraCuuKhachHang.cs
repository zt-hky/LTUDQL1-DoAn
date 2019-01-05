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
    public partial class ucTraCuuKhachHang : UserControl
    {
        private static ucTraCuuKhachHang _instance;
        public static ucTraCuuKhachHang Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucTraCuuKhachHang();
                return _instance;
            }
        }
        public ucTraCuuKhachHang()
        {
            InitializeComponent();
        }
       
        private void btnSearch_Click(object sender, EventArgs e)
        {

            DataTable kh = KhachHangBUS.Instance.TimKiemKhachHang(txtBoxCMND.Text);
            if(kh.Rows.Count==0)
            {
                MessageBox.Show("Không Tìm Thấy Khách Hàng!");
            }
            else dgvKhachHang.DataSource = kh;
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            int res = KhachHangBUS.Instance.ThemCMNDKhachHang(txtBoxCMND.Text);
            if(res==0)
            {
                MessageBox.Show("Không thể thêm Khách hàng");
            }
            else
            {
                FrmThemKhachHang frmKH = new FrmThemKhachHang();
                frmKH.ShowDialog();
                MessageBox.Show("Thêm khách hàng thành công!");
            }
        }
    }
}
