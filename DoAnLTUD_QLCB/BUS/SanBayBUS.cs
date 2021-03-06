﻿using DAO;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class SanBayBUS
    {
        private static SanBayBUS instance;

        public static SanBayBUS Instance {
            get
            {
                if (instance == null)
                    SanBayBUS.instance = new SanBayBUS();
                return instance;
            }
        }

        private SanBayBUS() { }

        public List<SanBay> getAll()
        {
            return SanBayDAO.Instance.getAll();
        }

        public DataTable LoadSanBay()
        {
            return SanBayDAO.Instance.LoadSanBay();
        }

        public DataTable LoadSanBayTheoMa(SanBay sb)
        {
            return SanBayDAO.Instance.LoadSanBayTheoMa(sb);
        }
    }
}
