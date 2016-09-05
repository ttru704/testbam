using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class EmployeeSearchBoxBL: IDisposable
    {
        private IEmployeeSearchBoxRepo EmployeeSearchBoxRepo;

        public EmployeeSearchBoxBL()
        {
            EmployeeSearchBoxRepo = new EmployeeSearchBoxRepo();
        }

        public EmployeeSearchBoxBL(IEmployeeSearchBoxRepo EmployeeSearchBoxRepo)
        {
            this.EmployeeSearchBoxRepo = EmployeeSearchBoxRepo;
        }

        public List<usp_EmployeeSearchBox_Result> usp_EmployeeSearchBox(int? companyRef)
        {
            return EmployeeSearchBoxRepo.usp_EmployeeSearchBox(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    EmployeeSearchBoxRepo.Dispose();
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