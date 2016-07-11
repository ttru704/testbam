using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class AnimalsSeenBL : IDisposable
    {
        private IAnimalsSeenRepository AnimalsSeenRepository;

        public AnimalsSeenBL()
        {
            AnimalsSeenRepository = new AnimalsSeenRepository();
        }

        public AnimalsSeenBL(IAnimalsSeenRepository AnimalsSeenRepository)
        {
            this.AnimalsSeenRepository = AnimalsSeenRepository;
        }

        public List<AnimalsSeenBComparison_Result> AnimalsSeenBComparison(DateTime start, DateTime end, int branchRef, int timeType)
        {
            return AnimalsSeenRepository.AnimalsSeenBComparison(start, end, branchRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    AnimalsSeenRepository.Dispose();
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