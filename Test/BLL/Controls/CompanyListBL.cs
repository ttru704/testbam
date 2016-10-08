using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class CompanyListBL : IDisposable
    {
        private ICompanyListRepo CompanyListRepo;

        public CompanyListBL()
        {
            CompanyListRepo = new CompanyListRepo();
        }

        public CompanyListBL(ICompanyListRepo CompanyListRepo)
        {
            this.CompanyListRepo = CompanyListRepo;
        }

        public List<usp_CompanyList_Result> usp_CompanyList()
        {
            return CompanyListRepo.usp_CompanyList();
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    CompanyListRepo.Dispose();
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