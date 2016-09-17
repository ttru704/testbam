using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenSingleBL : IDisposable
    {
        private IAnimalsSeenSingleRepo animalsSeenSingleRepo;

        public AnimalsSeenSingleBL()
        {
            animalsSeenSingleRepo = new AnimalsSeenSingleRepo();
        }

        public AnimalsSeenSingleBL(IAnimalsSeenSingleRepo animalsSeenSingleRepo)
        {
            this.animalsSeenSingleRepo = animalsSeenSingleRepo;
        }

        public double? usp_AnimalsSeenSingle(Int64? companyRef)
        {
            return animalsSeenSingleRepo.usp_AnimalsSeenSingle(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenSingleRepo.Dispose();
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