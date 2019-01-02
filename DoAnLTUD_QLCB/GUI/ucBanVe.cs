using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
    }
}
