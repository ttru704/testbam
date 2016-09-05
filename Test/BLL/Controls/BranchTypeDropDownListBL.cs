using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class BranchTypeDropDownListBL:IDisposable
    {
        private IBranchTypeDropDownListRepo BranchTypeDropDownListRepo;

        public BranchTypeDropDownListBL()
        {
            BranchTypeDropDownListRepo = new BranchTypeDropDownListRepo();
        }

        public BranchTypeDropDownListBL(IBranchTypeDropDownListRepo BranchTypeDropDownListRepo)
        {
            this.BranchTypeDropDownListRepo = BranchTypeDropDownListRepo;
        }

        public List<usp_BranchTypeDropDownList_Result> usp_BranchTypeDropDownList(int? businessType)
        {
            return BranchTypeDropDownListRepo.usp_BranchTypeDropDownList(businessType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    BranchTypeDropDownListRepo.Dispose();
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