using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class AnimalsSeenByEmployeeCompanyBL : IDisposable
    {
        private IAnimalsSeenByEmployeeCompanyRepo animalsSeenByEmployeeCompanyRepo;

        public AnimalsSeenByEmployeeCompanyBL()
        {
            animalsSeenByEmployeeCompanyRepo = new AnimalsSeenByEmployeeCompanyRepo();
        }

        public AnimalsSeenByEmployeeCompanyBL(IAnimalsSeenByEmployeeCompanyRepo animalsSeenByEmployeeCompanyRepo)
        {
            this.animalsSeenByEmployeeCompanyRepo = animalsSeenByEmployeeCompanyRepo;
        }

        public List<usp_AnimalsSeenByEmployeeCompany_Result> usp_AnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, int? companyRef, int? timeType)
        {
            return animalsSeenByEmployeeCompanyRepo.usp_AnimalsSeenByEmployeeCompany(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenByEmployeeCompanyRepo.Dispose();
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