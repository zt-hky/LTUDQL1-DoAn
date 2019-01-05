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
    public partial class ucThayDoiQuyDinh : UserControl
    {
        private static ucThayDoiQuyDinh _instance;
        public static ucThayDoiQuyDinh Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucThayDoiQuyDinh();
                return _instance;
            }
        }
        public ucThayDoiQuyDinh()
        {
            InitializeComponent();
        }

        private void groupBox5_Enter(object sender, EventArgs e)
        {

        }
    }
}
