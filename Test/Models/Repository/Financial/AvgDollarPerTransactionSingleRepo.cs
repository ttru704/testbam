﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Financial;

namespace Test.Models.Repository.Financial
{
    public class AvgDollarPerTransactionSingleRepo : IDisposable, IAvgDollarPerTransactionSingleRepo
    {
        private KPIEntities context = new KPIEntities();

        public AvgDollarPerTransactionSingleRepo()
        {

        }

        double? IAvgDollarPerTransactionSingleRepo.usp_AvgDollarPerTransactionSingle(Int64? companyRef)
        {
            return context.usp_AvgDollarPerTransactionSingle(companyRef).SingleOrDefault();
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