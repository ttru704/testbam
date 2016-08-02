using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class LargeAnimalsComBL
    {
        private ILargeAnimalsComRepo largeAnimalsComRepo;

        public LargeAnimalsComBL()
        {
            largeAnimalsComRepo = new LargeAnimalsComRepo();
        }

        public LargeAnimalsComBL(ILargeAnimalsComRepo largeAnimalsComRepo)
        {
            this.largeAnimalsComRepo = largeAnimalsComRepo;
        }

        public List<usp_LargeAnimalsCom_Result> usp_LargeAnimalsCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return largeAnimalsComRepo.usp_LargeAnimalsCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    largeAnimalsComRepo.Dispose();
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