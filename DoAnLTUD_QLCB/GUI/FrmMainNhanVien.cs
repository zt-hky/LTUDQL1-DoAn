using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class FrmMainNhanVien : Form
    {
        public FrmMainNhanVien()
        {
            InitializeComponent();
        }

        private void btnTraCuuCB_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucTraCuuChuyenBay.Instance))
            {
                panel.Controls.Add(ucTraCuuChuyenBay.Instance);
                ucTraCuuChuyenBay.Instance.Dock = DockStyle.Fill;
                ucTraCuuChuyenBay.Instance.BringToFront();
            }
            else
                ucTraCuuChuyenBay.Instance.BringToFront();
        }

        private void btnTraCuuKhachHang_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucTraCuuKhachHang.Instance))
            {
                panel.Controls.Add(ucTraCuuKhachHang.Instance);
                ucTraCuuKhachHang.Instance.Dock = DockStyle.Fill;
                ucTraCuuKhachHang.Instance.BringToFront();
            }
            else
                ucTraCuuKhachHang.Instance.BringToFront();
        }

        private void btnNhanLichChuyenBay_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucNhanLichChuyenBay.Instance))
            {
                panel.Controls.Add(ucNhanLichChuyenBay.Instance);
                ucNhanLichChuyenBay.Instance.Dock = DockStyle.Fill;
                ucNhanLichChuyenBay.Instance.BringToFront();
            }
            else
                ucNhanLichChuyenBay.Instance.BringToFront();
        }

        private void btnDatCho_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucDatCho.Instance))
            {
                panel.Controls.Add(ucDatCho.Instance);
                ucDatCho.Instance.Dock = DockStyle.Fill;
                ucDatCho.Instance.BringToFront();
            }
            else
                ucDatCho.Instance.BringToFront();
        }

        private void btnBanVe_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucBanVe.Instance))
            {
                panel.Controls.Add(ucBanVe.Instance);
                ucBanVe.Instance.Dock = DockStyle.Fill;
                ucBanVe.Instance.BringToFront();
            }
            else
                ucBanVe.Instance.BringToFront();
        }
    }
}
