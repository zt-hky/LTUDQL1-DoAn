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


        private void btnBaoCaoThang_Click(object sender, EventArgs e)
        {
            int thang = int.Parse(dtpThang.Text);
            int nam = int.Parse(dtpNam.Text);
            DataTable dt = BaoCaoBUS.Instance.ThongKeThang(thang, nam);
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("Thống kê theo tháng KHÔNG thành công!");
            }
            else
            {
                dgvBaoCao.DataSource = dt;
                DialogResult dlr = MessageBox.Show("Xuất ra File Excel?", "Xuất Báo Cáo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    DataTable dtExcel = new DataTable();
                    dtExcel = (DataTable)dgvBaoCao.DataSource;
                    ExportToExcelBUS.Instance.ExportThang(dtExcel);
                }
            }
            
            

        }

        private void btnBaoCaoNam_Click(object sender, EventArgs e)
        {
            int nam = int.Parse(dtpNam.Text);
            DataTable dt = BaoCaoBUS.Instance.ThongKeNam(nam);
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("Thống kê theo năm KHÔNG thành công!");
            }
            else
            {
                dgvBaoCao.DataSource = dt;
                DialogResult dlr = MessageBox.Show("Xuất ra File Excel?", "Xuất Báo Cáo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.Yes)
                {
                    DataTable dtExcel = new DataTable();
                    dtExcel = (DataTable)dgvBaoCao.DataSource;
                    ExportToExcelBUS.Instance.ExportNam(dtExcel);
                }
            }
          
        }
    }
}
