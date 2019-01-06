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
            Load();
        }

        private void Load()
        {
            // Load Danh sách chuyến bay
            List<ChuyenBay> dsChuyenBay = ChuyenBayBUS.Instance.getAll();
            List<SanBay> dsSanBay = SanBayBUS.Instance.getAll();

            foreach(ChuyenBay cb in dsChuyenBay)
            {
                string tenSBDi = dsSanBay.Find(x => x.MaSB == cb.SBDi).TenSB;
                string tenSBDen = dsSanBay.Find(x => x.MaSB == cb.SBDen).TenSB;
                this.dgwChuyenBay.Rows.Add(cb.MaCB, cb.NgayGio, cb.TGBay, tenSBDi, tenSBDen, cb.SLGhe1, cb.SLGhe2,cb.SBDi,cb.SBDen);
            }

            List<SanBay> dsSBDi = SanBayBUS.Instance.getAll(); ;
            List<SanBay> dsSBDen = SanBayBUS.Instance.getAll(); ;

            this.cbSBDi.DataSource = dsSBDi;
            this.cbSBDi.DisplayMember = "TenSB";
            this.cbSBDi.ValueMember = "MaSB";

            this.cbSBDen.DataSource = dsSBDen;
            this.cbSBDen.DisplayMember = "TenSB";
            this.cbSBDen.ValueMember = "MaSB";


            List<SanBay> lstSBTG = SanBayBUS.Instance.getAll(); ;


            this.SBTrungGian.DataSource = lstSBTG;


        }


        private void LoadChiTietChuyenBay()
        {

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
            if(e.RowIndex >= 0 )
            {
                DataGridViewRow row = this.dgwChuyenBay.Rows[e.RowIndex];

                this.tbMaCB.Text = row.Cells["MaCB"].Value.ToString();
                this.dtpTime.Text = row.Cells["ThoiGian"].Value.ToString();
                this.tbTGBay.Text = row.Cells["TGBay"].Value.ToString();
                this.cbSBDi.SelectedValue = row.Cells["MaSBDi"].Value;
                this.cbSBDen.SelectedValue = row.Cells["MaSBDen"].Value;
                this.tbSLGhe1.Text = row.Cells["SLGhe1"].Value.ToString();
                this.tbSLGhe2.Text = row.Cells["SLGhe2"].Value.ToString();

                LoadDGWSanBayTrungGian(row.Cells["MaCB"].Value.ToString());

            }
           
        }

        private void LoadDGWSanBayTrungGian(string MaCB)
        {
            this.dgwSBTrungGian.Rows.Clear();

            List<ChiTietChuyenBay> chiTietChuyenBays = ChiTietChuyenBayBUS.Instance.getByMaCB(MaCB);

            foreach(ChiTietChuyenBay CT in chiTietChuyenBays )
            {
                                
                this.dgwSBTrungGian.Rows.Add(CT.STT,CT.MaSBTG, CT.TGDung, CT.GhiChu);
            }

        }
    }
}
