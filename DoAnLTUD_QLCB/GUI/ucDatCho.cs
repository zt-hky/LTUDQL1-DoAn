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
    public partial class ucDatCho : UserControl
    {
        private static ucDatCho _instance;
        public static ucDatCho Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ucDatCho();
                return _instance;
            }
        }
        public ucDatCho()
        {
            InitializeComponent();
        }
    }
}
