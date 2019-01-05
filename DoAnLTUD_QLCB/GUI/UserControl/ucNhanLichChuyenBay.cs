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
    public partial class ucNhanLichChuyenBay : UserControl
    {
        private static ucNhanLichChuyenBay _instance;
        public static ucNhanLichChuyenBay Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucNhanLichChuyenBay();
                return _instance;
            }
        }
        public ucNhanLichChuyenBay()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
