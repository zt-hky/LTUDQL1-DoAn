using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class ExportToExcelBUS
    {
        private static ExportToExcelBUS instance;

        public static ExportToExcelBUS Instance
        {
            get
            {
                if (instance == null)
                    ExportToExcelBUS.instance = new ExportToExcelBUS();
                return instance;
            }
        }

        private ExportToExcelBUS() { }

        public void ExportThang(DataTable dt, string sheetName = "Thống Kê Tháng", string title = "Báo Cáo Doanh Thu Bán Vé Các Chuyến Bay")
        {
            //ExportToExcelDAO.Instance.ExportThang(dt, sheetName, title);
        }

        public void ExportNam(DataTable dt, string sheetName="Thống Kê Năm", string title= "Báo Cáo Doanh Thu Năm")
        {
            //ExportToExcelDAO.Instance.ExportNam(dt, sheetName, title);
        }

    }
}
