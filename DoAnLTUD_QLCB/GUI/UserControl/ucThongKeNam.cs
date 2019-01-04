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
    public partial class ucThongKeNam : UserControl
    {
        private static ucThongKeNam _instance;
        public static ucThongKeNam Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucThongKeNam();
                return _instance;
            }
        }
        public ucThongKeNam()
        {
            InitializeComponent();
        }
    }
}
