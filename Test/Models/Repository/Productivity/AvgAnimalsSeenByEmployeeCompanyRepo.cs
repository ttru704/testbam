﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Productivity;

namespace Test.Models.Repository.Productivity
{
    public class AvgAnimalsSeenByEmployeeCompanyRepo: IDisposable, IAvgAnimalsSeenByEmployeeCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgAnimalsSeenByEmployeeCompanyRepo()
        {

        }

        List<usp_AvgAnimalsSeenByEmployeeCompany_Result> IAvgAnimalsSeenByEmployeeCompanyRepo.usp_AvgAnimalsSeenByEmployeeCompany(DateTime? start, DateTime? end, int? companyRef, int? timeType)
        {
            return context.usp_AvgAnimalsSeenByEmployeeCompany(start, end, companyRef, timeType).ToList();
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