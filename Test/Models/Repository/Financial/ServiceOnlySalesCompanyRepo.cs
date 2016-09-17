﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class ServiceOnlySalesCompanyRepo : IDisposable, IServiceOnlySalesCompanyRepo
    {
        private KPIEntities context = new KPIEntities();

        public ServiceOnlySalesCompanyRepo()
        {

        }

        List<usp_ServiceOnlySalesCompany_Result> IServiceOnlySalesCompanyRepo.usp_ServiceOnlySalesCompany(DateTime? start, DateTime? end, long companyRef, int timeType)
        {
            return context.usp_ServiceOnlySalesCompany(start, end, companyRef, timeType).ToList();
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