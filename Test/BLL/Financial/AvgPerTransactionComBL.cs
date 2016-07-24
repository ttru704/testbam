using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;
namespace Test.BLL.Financial
{
    public class AvgPerTransactionComBL : IDisposable
    {
        private IAvgPerTransactionComRepo AvgPerTransactionComRepo;

        public AvgPerTransactionComBL()
        {
            AvgPerTransactionComRepo = new AvgPerTransactionComRepo();
        }

        public AvgPerTransactionComBL(IAvgPerTransactionComRepo AvgPerTransactionComRepo)
        {
            this.AvgPerTransactionComRepo = AvgPerTransactionComRepo;
        }

        public List<usp_AvgPerTransactionCom_Result> usp_AvgPerTransactionCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return AvgPerTransactionComRepo.usp_AvgPerTransactionCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgPerTransactionComRepo.Dispose();
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