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
        }
    }
}
