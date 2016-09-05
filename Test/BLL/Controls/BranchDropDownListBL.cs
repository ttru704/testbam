using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class BranchDropDownListBL : IDisposable
    {
        private IBranchDropDownListRepo BranchDropDownListRepo;

        public BranchDropDownListBL()
        {
            BranchDropDownListRepo = new BranchDropDownListRepo();
        }

        public BranchDropDownListBL(IBranchDropDownListRepo BranchDropDownListRepo)
        {
            this.BranchDropDownListRepo = BranchDropDownListRepo;
        }

        public List<usp_BranchDropDownList_Result> usp_BranchDropDownList(int companyRef)
        {
            return BranchDropDownListRepo.usp_BranchDropDownList(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    BranchDropDownListRepo.Dispose();
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