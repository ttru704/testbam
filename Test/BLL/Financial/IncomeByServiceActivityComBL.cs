using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class IncomeByServiceActivityComBL : IDisposable
    {
        private IIncomeByServiceActivityComRepo IncomeByServiceActivityComRepo;

        public IncomeByServiceActivityComBL()
        {
            IncomeByServiceActivityComRepo = new IncomeByServiceActivityComRepo();
        }

        public IncomeByServiceActivityComBL(IncomeByServiceActivityComRepo IncomeByServiceActivityComRepo)
        {
            this.IncomeByServiceActivityComRepo = IncomeByServiceActivityComRepo;
        }

        public List<usp_IncomeByServiceActivityCom_Result> usp_IncomeByServiceActivityCom(DateTime start, DateTime end, int companyRef)
        {
            return IncomeByServiceActivityComRepo.usp_IncomeByServiceActivityCom(start, end, companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    IncomeByServiceActivityComRepo.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}