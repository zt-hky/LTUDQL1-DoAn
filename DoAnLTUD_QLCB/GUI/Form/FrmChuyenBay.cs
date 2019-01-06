using BUS;
using DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.From
{
    public partial class FrmChuyenBay : Form
    {
        private bool FromInfo;
        private string MaCB;
        public FrmChuyenBay(bool info, string MaCB)
        {
            this.FromInfo = info;
            this.MaCB = MaCB;
            InitializeComponent();

            Load();

        }

        private void Load()
        {
            this.cbSBDi.DataSource = SanBayBUS.Instance.getAll();
            this.cbSBDen.DataSource = SanBayBUS.Instance.getAll();


            this.cbSBDi.DisplayMember = "TenSB";
            this.cbSBDi.ValueMember = "MaSB";

            this.cbSBDen.DisplayMember = "TenSB";
            this.cbSBDen.ValueMember = "MaSB";

            this.SBTrungGian.DataSource = SanBayBUS.Instance.getAll();
            this.SBTrungGian.DisplayMember = "TenSB";
            this.SBTrungGian.ValueMember = "MaSB";

            if (this.FromInfo)
            {
                // ---Thêm
                this.btn.Text = "Thêm";
                this.tbMaCB.ReadOnly = false;
                DataRow dr = RangBuocBUS.Instance.LoadRangBuoc().Rows[0];
                this.numSL.Maximum = int.Parse(dr["SBTGMax"].ToString());

            }

            else
            {
                // --- Sửa
                this.btn.Text = "Sửa";
                this.tbMaCB.ReadOnly = true;

                ChuyenBay CB = ChuyenBayBUS.Instance.getByMaCB(this.MaCB);

                this.tbMaCB.Text = CB.MaCB;
                this.tbSLGhe1.Text = CB.SLGhe1.ToString() ;
                this.tbSLGhe2.Text = CB.SLGhe2.ToString();
                this.dtpTime.Value = CB.NgayGio;
                this.cbSBDi.SelectedValue = CB.SBDi;
                this.cbSBDen.SelectedValue = CB.SBDen;
                this.tbTGBay.Text = CB.TGBay.ToString();
                List<ChiTietChuyenBay> chiTietChuyenBays = ChiTietChuyenBayBUS.Instance.getByMaCB(MaCB);
                

                foreach(ChiTietChuyenBay CT in chiTietChuyenBays)
                {
                    this.dgwSBTrungGian.Rows.Add(CT.STT, CT.MaSBTG, CT.TGDung, CT.GhiChu);
                }
                this.numSL.Value = chiTietChuyenBays.Count();
            }

            this.numSL.Minimum = 0;

            


            
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_Click(object sender, EventArgs e)
        {

            ChuyenBay ct = new ChuyenBay();
            ct.MaCB = this.tbMaCB.Text;
            ct.NgayGio = this.dtpTime.Value;
            ct.SBDen = this.cbSBDen.SelectedValue.ToString();
            ct.SBDi = this.cbSBDi.SelectedValue.ToString();
            ct.SLGhe1 = int.Parse(this.tbSLGhe1.Text);
            ct.SLGhe2 = int.Parse(this.tbSLGhe2.Text);
            ct.TGBay = int.Parse(this.tbTGBay.Text);

            List<ChiTietChuyenBay> ctcb = new List<ChiTietChuyenBay>();

            DataGridViewRowCollection lstRow = this.dgwSBTrungGian.Rows;

            foreach(DataGridViewRow row in lstRow)
            {
                ChiTietChuyenBay a = new ChiTietChuyenBay();
                a.MaCB = ct.MaCB;
                a.STT = int.Parse(row.Cells["STT"].Value.ToString());
                a.MaSBTG = row.Cells["SBTrungGian"].Value.ToString();
                a.TGDung = int.Parse(row.Cells["TGDung"].Value.ToString());
                a.GhiChu = row.Cells["GhiChu"].Value.ToString();
                ctcb.Add(a);
            }

            if (this.FromInfo)
            {
                bool check = ChuyenBayBUS.Instance.Insert(ct, ctcb);
                if(check)
                {
                    MessageBox.Show("Thêm thành công");
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Thêm không thành công");
                }
               
            }

            else
            {

            }
        }

        private void CheckValue()
        {

        }

        private void Add()
        {

        }

        private void Update()
        {

        }

        private void tbMaCB_KeyUp(object sender, KeyEventArgs e)
        {
            string MaCB = this.tbMaCB.Text;
            if(MaCB != "")
            {
                bool check = ChuyenBayBUS.Instance.checkMaCB(MaCB);
                if(check)
                {
                    this.LabeTrung.Visible = true;
                    this.LabelHopLe.Visible = false;
                }
                else
                {
                    this.LabeTrung.Visible = false;
                    this.LabelHopLe.Visible = true;
                }
            }
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
