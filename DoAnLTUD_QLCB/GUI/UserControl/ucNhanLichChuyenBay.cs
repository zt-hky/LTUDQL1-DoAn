using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DTO;
using BUS;

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
            LoadChuyenBay();
        }

        private void LoadChuyenBay()
        {
            List<ChuyenBay> dsChuyenBay = ChuyenBayBUS.Instance.getAll();

            List<SanBay> dsSanBay = SanBayBUS.Instance.getAll();


            foreach(ChuyenBay cb in dsChuyenBay)
            {
                string tenSBDi = dsSanBay.Find(x => x.MaSB == cb.SBDi).TenSB;
                string tenSBDen = dsSanBay.Find(x => x.MaSB == cb.SBDen).TenSB;
                this.dgwChuyenBay.Rows.Add(cb.MaCB, cb.NgayGio, cb.TGBay, tenSBDi, tenSBDen, cb.SLGhe1, cb.SLGhe2);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void chuyenBayBUSBindingSource_CurrentChanged(object sender, EventArgs e)
        {

        }

        private void dgwChuyenBay_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
