using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class AnimalsSeenByEmployeeCompanyRepo : IDisposable, IAnimalsSeenByEmployeeCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public AnimalsSeenByEmployeeCompanyRepo()
        {

        }

        List<usp_AnimalsSeenByEmployeeCompany_Result> IAnimalsSeenByEmployeeCompanyRepo.usp_AnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, Int64? companyRef, int? timeType)
        {
            return context.usp_AnimalsSeenByEmployeeCompany(start, end, companyRef, timeType).ToList();
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
                disposedValue = true;
            }
        }

        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}