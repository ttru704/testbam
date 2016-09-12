using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class ViewableKpiListBL : IDisposable
    {
        private IViewableKpiListRepo ViewableKpiListRepo;

        public ViewableKpiListBL()
        {
            ViewableKpiListRepo = new ViewableKpiListRepo();
        }

        public ViewableKpiListBL(IViewableKpiListRepo ViewableKpiListRepo)
        {
            this.ViewableKpiListRepo = ViewableKpiListRepo;
        }

        public List<usp_ViewableKpiList_Result> usp_ViewableKpiList(string userRef, int kpiType, string kpiTab)
        {
            return ViewableKpiListRepo.usp_ViewableKpiList(userRef, kpiType, kpiTab);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    ViewableKpiListRepo.Dispose();
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