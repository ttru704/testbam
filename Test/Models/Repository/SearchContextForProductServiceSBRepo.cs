using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class SearchContextForProductServiceSBRepo:IDisposable, ISearchContextForProductServiceSBRepo
    {
        private KPIEntities context = new KPIEntities();

        public SearchContextForProductServiceSBRepo()
        {

        }

        List<usp_SearchContextForProductServiceSB_Result> ISearchContextForProductServiceSBRepo.usp_SearchContextForProductServiceSB()
        {
            return context.usp_SearchContextForProductServiceSB().ToList();
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