using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Customer;
using Test.Models.Repository.Customer;

namespace Test.BLL.Customer
{
    public class NewClientsComBL
    {
        private INewClientsComRepo newClientsComRepo;

        public NewClientsComBL()
        {
            newClientsComRepo = new NewClientsComRepo();
        }

        public NewClientsComBL(INewClientsComRepo newClientsComRepo)
        {
            this.newClientsComRepo = newClientsComRepo;
        }

        public List<usp_NewClientsCom_Result> usp_NewClientsCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return newClientsComRepo.usp_NewClientsCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    newClientsComRepo.Dispose();
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