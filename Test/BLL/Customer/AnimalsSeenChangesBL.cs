using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenChangesBL : IDisposable
    {
        private IAnimalsSeenChangesRepo animalsSeenChangesRepo;

        public AnimalsSeenChangesBL()
        {
            animalsSeenChangesRepo = new AnimalsSeenChangesRepo();
        }

        public AnimalsSeenChangesBL(IAnimalsSeenChangesRepo animalsSeenChangesRepo)
        {
            this.animalsSeenChangesRepo = animalsSeenChangesRepo;
        }

        public double? usp_AnimalsSeenChanges(int companyRef)
        {
            return animalsSeenChangesRepo.usp_AnimalsSeenChanges(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenChangesRepo.Dispose();
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