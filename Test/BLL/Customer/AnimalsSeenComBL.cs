using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenComBL
    {
        private IAnimalsSeenComRepo animalsSeenComRepo;

        public AnimalsSeenComBL()
        {
            animalsSeenComRepo = new AnimalsSeenComRepo();
        }

        public AnimalsSeenComBL(IAnimalsSeenComRepo animalsSeenComRepo)
        {
            this.animalsSeenComRepo = animalsSeenComRepo;
        }

        public List<usp_AnimalsSeenCom_Result> usp_AnimalsSeenCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return animalsSeenComRepo.usp_AnimalsSeenCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenComRepo.Dispose();
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