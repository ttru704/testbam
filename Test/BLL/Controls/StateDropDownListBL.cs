using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class StateDropDownListBL: IDisposable
    {
        private IStateDropDownListRepo StateDropDownListRepo;

        public StateDropDownListBL()
        {
            StateDropDownListRepo = new StateDropDownListRepo();
        }

        public StateDropDownListBL(IStateDropDownListRepo StateDropDownListRepo)
        {
            this.StateDropDownListRepo = StateDropDownListRepo;
        }

        public List<usp_StateDropDownList_Result> usp_StateDropDownList(long? countryRef)
        {
            return StateDropDownListRepo.usp_StateDropDownList(countryRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    StateDropDownListRepo.Dispose();
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