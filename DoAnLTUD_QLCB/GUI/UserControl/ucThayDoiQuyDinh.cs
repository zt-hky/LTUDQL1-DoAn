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
using DTO;

namespace GUI
{
    public partial class ucThayDoiQuyDinh : UserControl
    {
        private static ucThayDoiQuyDinh _instance;
        RangBuoc rb;
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

        void loadThongTin()
        {
            DataTable dt = RangBuocBUS.Instance.LoadRangBuoc();
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("Không load được ràng buộc!");
            }
            else
            {
                foreach(DataRow r in dt.Rows)
                {
                    txtSLSanBay.Text = r["SLSanBay"].ToString();
                    nmSoLuongSanBayMoi.Value = int.Parse(r["SLSanBay"].ToString());
                    txtThoiGianBayMin.Text = r["ThoiGianBayMin"].ToString();
                    nmThoiGianBayMin.Value = int.Parse( r["ThoiGianBayMin"].ToString());
                    txtSLSanBayTrungGian.Text = r["SBTGMax"].ToString();
                    nmSLSanBayTrungGianMax.Value = int.Parse(r["SBTGMax"].ToString());
                    txtThoiGianDungToiThieu.Text = r["TGDungMin"].ToString();
                    nmThoiGianDungMin.Value = int.Parse(r["TGDungMin"].ToString());
                    txtThoiGianDungToiDa.Text = r["TGDungMax"].ToString();
                    nmThoiGianDungMax.Value = int.Parse(r["TGDungMax"].ToString());
                    txtSoLuongHangVe1.Text = r["SLHangVe1"].ToString();
                    nmSoLuongHangVe1Moi.Value = int.Parse(r["SLHangVe1"].ToString());
                    txtSoLuongHangVe2.Text = r["SLHangVe2"].ToString();
                    nmSoLuongHangVe2Moi.Value = int.Parse(r["SLHangVe2"].ToString());
                    txtThoiGianChamNhatDatVe.Text = r["TGDatVe"].ToString();
                    nmThoiGianChamNhatDatVeMoi.Value = int.Parse(r["TGDatVe"].ToString());
                    txtThoiGianHuyDatVe.Text = r["TGHuyVe"].ToString();
                    nmThoiGianHuyDatVe.Value = int.Parse(r["TGHuyVe"].ToString());
                    break;
                }
            }
        }

        private void ucThayDoiQuyDinh_Load(object sender, EventArgs e)
        {
            loadThongTin();
        }

        private void btnThayDoiSoLuongSanBay_Click(object sender, EventArgs e)
        {
            int slSanBay = unchecked((int)nmSoLuongSanBayMoi.Value);
            rb = new RangBuoc();
            rb.SLSanBay = slSanBay;
          
            int res = RangBuocBUS.Instance.UpdateSoLuongSanBay(rb);
            if (res == 0)
            {
                MessageBox.Show("Không thể Update số lượng sân bay!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update số lượng sân bay thành công!");
            }
        }

        private void btnThayDoiDatVe_Click(object sender, EventArgs e)
        {
            int tgDatVe = unchecked((int)nmThoiGianChamNhatDatVeMoi.Value);
            rb = new RangBuoc();
            rb.TGDatVe = tgDatVe;

            int res = RangBuocBUS.Instance.UpdateThoiGianThoiGianChamNhatDatVe(rb);
            if (res == 0)
            {
                MessageBox.Show("Update Không thành công!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }
        }

        private void btnThayDoiThoiGianBay_Click(object sender, EventArgs e)
        {
            int tgbay = unchecked((int)nmThoiGianBayMin.Value);
            rb = new RangBuoc();
            rb.ThoiGianBayMin = tgbay;

            int res = RangBuocBUS.Instance.UpdateThoiGianBayToiThieu(rb);
            if (res == 0)
            {
                MessageBox.Show("Không thể Update!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }
        }

        private void btnThayDoiSoSanBayTrungGianMax_Click(object sender, EventArgs e)
        {
            int slSanBay = unchecked((int)nmSLSanBayTrungGianMax.Value);
            rb = new RangBuoc();
            rb.SBTGMax = slSanBay;

            int res = RangBuocBUS.Instance.UpdateSoLuongSanBayTrungGian(rb);
            if (res == 0)
            {
                MessageBox.Show("Không thể Update!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }

        }

        private void btnThayDoiThoiGianDung_Click(object sender, EventArgs e)
        {
            int tgMin = unchecked((int)nmThoiGianDungMin.Value);
            int tgMax = unchecked((int)nmThoiGianDungMax.Value);
            rb = new RangBuoc();
            rb.TGDungMin = tgMin;
            rb.TGDungMax = tgMax;

            int res = RangBuocBUS.Instance.UpdateThoiGianDung(rb);
            if (res == 0)
            {
                MessageBox.Show("Không thể Update!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }
        }

      

            
        private void btnThayDoiHuyDatVe_Click(object sender, EventArgs e)
        {
            int tgHuyVe = unchecked((int)nmThoiGianHuyDatVe.Value);
            rb = new RangBuoc();
            rb.TGHuyVe = tgHuyVe;

            int res = RangBuocBUS.Instance.UpdateThoiGianThoiGianHuyDatVe(rb);
            if (res == 0)
            {
                MessageBox.Show("Update Không thành công!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }
        }

        private void btnThayDoiSoLuongHangVe_Click(object sender, EventArgs e)
        {
            int slHang1 = unchecked((int)nmSoLuongHangVe1Moi.Value);
            int slHang2 = unchecked((int)nmSoLuongHangVe2Moi.Value);

            rb = new RangBuoc();
            rb.SLHangVe1 = slHang1;
            rb.SLHangVe2 = slHang2;

            int res = RangBuocBUS.Instance.UpdateSoLuongHangVe(rb);
            if (res == 0)
            {
                MessageBox.Show("Update Không thành công!");
            }
            else
            {
                loadThongTin();
                MessageBox.Show("Update thành công!");
            }
        }
    }   
}
