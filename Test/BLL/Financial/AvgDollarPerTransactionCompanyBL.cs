using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;
namespace Test.BLL.Financial
{
    public class AvgDollarPerTransactionCompanyBL : IDisposable
    {
        private IAvgDollarPerTransactionCompanyRepo AvgDollarPerTransactionCompanyRepo;

        public AvgDollarPerTransactionCompanyBL()
        {
            AvgDollarPerTransactionCompanyRepo = new AvgDollarPerTransactionCompanyRepo();
        }

        public AvgDollarPerTransactionCompanyBL(IAvgDollarPerTransactionCompanyRepo AvgDollarPerTransactionCompanyRepo)
        {
            this.AvgDollarPerTransactionCompanyRepo = AvgDollarPerTransactionCompanyRepo;
        }

        public List<usp_AvgDollarPerTransactionCompany_Result> usp_AvgDollarPerTransactionCompany(DateTime start, DateTime end, long companyRef, int timeType)
        {
            return AvgDollarPerTransactionCompanyRepo.usp_AvgDollarPerTransactionCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AvgDollarPerTransactionCompanyRepo.Dispose();
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