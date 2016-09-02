using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface;

namespace Test.Models.Repository
{
    public class BranchTypeDropDownListRepo: IDisposable, IBranchTypeDropDownListRepo
    {
        private KPIEntities context = new KPIEntities();

        public BranchTypeDropDownListRepo()
        {

        }

        List<usp_BranchTypeDropDownList_Result> IBranchTypeDropDownListRepo.usp_BranchTypeDropDownList(int? businessType)
        {
            return context.usp_BranchTypeDropDownList(businessType).ToList();
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