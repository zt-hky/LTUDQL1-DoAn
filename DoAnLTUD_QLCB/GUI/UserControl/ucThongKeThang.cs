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
    public partial class ucThongKeThang : UserControl
    {
        private static ucThongKeThang _instance;
        public static ucThongKeThang Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucThongKeThang();
                return _instance;
            }
        }
        public ucThongKeThang()
        {
            InitializeComponent();
        }
    }
}
