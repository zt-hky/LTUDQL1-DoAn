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
    public partial class FrmMain : Form
    {
        public FrmMain()
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
    }
}
