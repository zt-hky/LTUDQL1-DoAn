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
        private void init()
        {

        }
        private void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}
