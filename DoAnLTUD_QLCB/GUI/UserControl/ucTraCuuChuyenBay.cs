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

namespace GUI
{
    public partial class ucTraCuuChuyenBay : UserControl
    {
        private static ucTraCuuChuyenBay _instance;
        public static ucTraCuuChuyenBay Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucTraCuuChuyenBay();
                return _instance;
            }
        }
        public ucTraCuuChuyenBay()
        {
            InitializeComponent();
            Init();
        }

        private void Init()
        {
            ChuyenBayBUS.Instance.LoadAll(this.dgvChuyenBay);
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void dgvChuyenBay_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
