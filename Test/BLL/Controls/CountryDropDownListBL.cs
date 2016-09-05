using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class CountryDropDownListBL: IDisposable
    {
        private ICountryDropDownListRepo CountryDropDownListRepo;

        public CountryDropDownListBL()
        {
            CountryDropDownListRepo = new CountryDropDownListRepo();
        }

        public CountryDropDownListBL(ICountryDropDownListRepo CountryDropDownListRepo)
        {
            this.CountryDropDownListRepo = CountryDropDownListRepo;
        }

        public List<usp_CountryDropDownList_Result> usp_CountryDropDownList(int? branchRef)
        {
            return CountryDropDownListRepo.usp_CountryDropDownList(branchRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    CountryDropDownListRepo.Dispose();
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