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
    public partial class FrmMainAdmin : Form
    {
        public FrmMainAdmin()
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

        private void btnThongKeThang_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucThongKeThang.Instance))
            {
                panel.Controls.Add(ucThongKeThang.Instance);
                ucThongKeThang.Instance.Dock = DockStyle.Fill;
                ucThongKeThang.Instance.BringToFront();
            }
            else
                ucThongKeThang.Instance.BringToFront();
        }

        private void btnThongKeNam_Click(object sender, EventArgs e)
        {
            if (!panel.Contains(ucThongKeNam.Instance))
            {
                panel.Controls.Add(ucThongKeNam.Instance);
                ucThongKeNam.Instance.Dock = DockStyle.Fill;
                ucThongKeNam.Instance.BringToFront();
            }
            else
                ucThongKeNam.Instance.BringToFront();
        }

        private void btnThayDoiQuyDinh_Click(object sender, EventArgs e)
        {

        }
    }
}
