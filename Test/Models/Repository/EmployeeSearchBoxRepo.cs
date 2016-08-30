using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class EmployeeSearchBoxRepo: IDisposable, IEmployeeSearchBoxRepo
    {
        private KPIEntities context = new KPIEntities();

        public EmployeeSearchBoxRepo()
        {

        }

        List<usp_EmployeeSearchBox_Result> IEmployeeSearchBoxRepo.usp_EmployeeSearchBox(int? companyRef)
        {
            return context.usp_EmployeeSearchBox(companyRef).ToList();
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