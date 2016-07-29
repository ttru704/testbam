using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TransExcludeZeroTotalComBL : IDisposable
    {
        private ITransExcludeZeroTotalComRepo transExcludeZeroTotalComRepo;

        public TransExcludeZeroTotalComBL()
        {
            transExcludeZeroTotalComRepo = new TransExcludeZeroTotalComRepo();
        }

        public TransExcludeZeroTotalComBL(ITransExcludeZeroTotalComRepo transExcludeZeroTotalComRepo)
        {
            this.transExcludeZeroTotalComRepo = transExcludeZeroTotalComRepo;
        }

        public List<usp_TransExcludeZeroTotalCom_Result> usp_TransExcludeZeroTotalCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return transExcludeZeroTotalComRepo.usp_TransExcludeZeroTotalCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    transExcludeZeroTotalComRepo.Dispose();
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