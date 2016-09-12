﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class ViewableKpiListRepo:IDisposable, IViewableKpiListRepo
    {
        private KPIEntities context = new KPIEntities();

        public ViewableKpiListRepo()
        {

        }

        List<usp_ViewableKpiList_Result> IViewableKpiListRepo.usp_ViewableKpiList(string userRef, int kpiType, string kpiTab)
        {
            return context.usp_ViewableKpiList(userRef, kpiType, kpiTab).ToList();
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