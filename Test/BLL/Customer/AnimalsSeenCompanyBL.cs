using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenCompanyBL
    {
        private IAnimalsSeenCompanyRepo animalsSeenCompanyRepo;

        public AnimalsSeenCompanyBL()
        {
            animalsSeenCompanyRepo = new AnimalsSeenCompanyRepo();
        }

        public AnimalsSeenCompanyBL(IAnimalsSeenCompanyRepo animalsSeenCompanyRepo)
        {
            this.animalsSeenCompanyRepo = animalsSeenCompanyRepo;
        }

        public List<usp_AnimalsSeenCompany_Result> usp_AnimalsSeenCompany(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return animalsSeenCompanyRepo.usp_AnimalsSeenCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenCompanyRepo.Dispose();
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