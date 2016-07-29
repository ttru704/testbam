﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class TotalSalesChangesRepo : IDisposable, ITotalSalesChangesRepo
    {
        private KPIEntities context = new KPIEntities();

        public TotalSalesChangesRepo()
        {

        }

        double? ITotalSalesChangesRepo.usp_TotalSalesChanges(int companyRef)
        {
            return context.usp_TotalSalesChanges(companyRef).SingleOrDefault();
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