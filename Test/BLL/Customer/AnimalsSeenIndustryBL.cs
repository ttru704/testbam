using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenIndustryBL : IDisposable
    {
        private IAnimalsSeenIndustryRepo animalsSeenIndustryRepo;

        public AnimalsSeenIndustryBL()
        {
            animalsSeenIndustryRepo = new AnimalsSeenIndustryRepo();
        }

        public AnimalsSeenIndustryBL(IAnimalsSeenIndustryRepo animalsSeenIndustryRepo)
        {
            this.animalsSeenIndustryRepo = animalsSeenIndustryRepo;
        }

        public List<usp_AnimalsSeenIndustry_Result> usp_AnimalsSeenIndustry(DateTime start, DateTime end, int companyRef, int size, int timeType)
        {
            return animalsSeenIndustryRepo.usp_AnimalsSeenIndustry(start, end, companyRef, size, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenIndustryRepo.Dispose();
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