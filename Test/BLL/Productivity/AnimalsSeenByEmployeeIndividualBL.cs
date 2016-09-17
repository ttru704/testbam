using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class AnimalsSeenByEmployeeIndividualBL : IDisposable
    {
        private IAnimalsSeenByEmployeeIndividualRepo animalsSeenByEmployeeIndividualRepo;

        public AnimalsSeenByEmployeeIndividualBL()
        {
            animalsSeenByEmployeeIndividualRepo = new AnimalsSeenByEmployeeIndividualRepo();
        }

        public AnimalsSeenByEmployeeIndividualBL(IAnimalsSeenByEmployeeIndividualRepo animalsSeenByEmployeeIndividualRepo)
        {
            this.animalsSeenByEmployeeIndividualRepo = animalsSeenByEmployeeIndividualRepo;
        }

        public List<usp_AnimalsSeenByEmployeeIndividual_Result> usp_AnimalsSeenByEmployeeIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? staffNumber, int? timeType)
        {
            return animalsSeenByEmployeeIndividualRepo.usp_AnimalsSeenByEmployeeIndividual(start, end, companyRef, staffNumber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenByEmployeeIndividualRepo.Dispose();
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