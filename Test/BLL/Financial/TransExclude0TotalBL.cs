using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Financial;
using Test.Models.Repository.Financial;

namespace Test.BLL.Financial
{
    public class TransExclude0TotalBL : IDisposable
    {
        private ITransExclude0TotalRepository TransExclude0TotalRepository;

        public TransExclude0TotalBL()
        {
            TransExclude0TotalRepository = new TransExclude0TotalRepository();
        }

        public TransExclude0TotalBL(ITransExclude0TotalRepository TransExclude0TotalRepository)
        {
            this.TransExclude0TotalRepository = TransExclude0TotalRepository;
        }

        public List<TransExclude0TotalBComparison_Result> TransExclude0TotalBComparison(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return TransExclude0TotalRepository.TransExclude0TotalBComparison(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    TransExclude0TotalRepository.Dispose();
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