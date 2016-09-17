using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class CustomersSeenByEmployeeIndividualBL: IDisposable
    {
        private ICustomersSeenByEmployeeIndividualRepo customersSeenByEmployeeIndividualRepo;

        public CustomersSeenByEmployeeIndividualBL()
        {
            customersSeenByEmployeeIndividualRepo = new CustomersSeenByEmployeeIndividualRepo();
        }

        public CustomersSeenByEmployeeIndividualBL(ICustomersSeenByEmployeeIndividualRepo customersSeenByEmployeeIndividualRepo)
        {
            this.customersSeenByEmployeeIndividualRepo = customersSeenByEmployeeIndividualRepo;
        }

        public List<usp_CustomersSeenByEmployeeIndividual_Result> usp_CustomersSeenByEmployeeIndividual(DateTime? start, DateTime? end, Int64? companyRef, long? staffNumber, int? timeType)
        {
            return customersSeenByEmployeeIndividualRepo.usp_CustomersSeenByEmployeeIndividual(start, end, companyRef, staffNumber, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    customersSeenByEmployeeIndividualRepo.Dispose();
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