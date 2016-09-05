using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class RegionDropDownListBL:IDisposable
    {
        private IRegionDropDownListRepo RegionDropDownListRepo;

        public RegionDropDownListBL()
        {
            RegionDropDownListRepo = new RegionDropDownListRepo();
        }

        public RegionDropDownListBL(IRegionDropDownListRepo RegionDropDownListRepo)
        {
            this.RegionDropDownListRepo = RegionDropDownListRepo;
        }

        public List<usp_RegionDropDownList_Result> usp_RegionDropDownList(int? stateRef)
        {
            return RegionDropDownListRepo.usp_RegionDropDownList(stateRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    RegionDropDownListRepo.Dispose();
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