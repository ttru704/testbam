using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;

namespace Test.Models.Repository.Controls
{
    public class CountryDropDownListRepo: IDisposable, ICountryDropDownListRepo
    {
        private KPIEntities context = new KPIEntities();

        public CountryDropDownListRepo()
        {

        }

        List<usp_CountryDropDownList_Result> ICountryDropDownListRepo.usp_CountryDropDownList(long? branchRef)
        {
            return context.usp_CountryDropDownList(branchRef).ToList();
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