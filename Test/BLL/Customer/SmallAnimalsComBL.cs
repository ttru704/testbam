using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class SmallAnimalsComBL
    {
        private ISmallAnimalsComRepo smallAnimalsComRepo;

        public SmallAnimalsComBL()
        {
            smallAnimalsComRepo = new SmallAnimalsComRepo();
        }

        public SmallAnimalsComBL(ISmallAnimalsComRepo smallAnimalsComRepo)
        {
            this.smallAnimalsComRepo = smallAnimalsComRepo;
        }

        public List<usp_SmallAnimalsCom_Result> usp_SmallAnimalsCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return smallAnimalsComRepo.usp_SmallAnimalsCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    smallAnimalsComRepo.Dispose();
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