using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;


namespace Test.BLL
{
    public class NumberOfNewClientsBL : IDisposable
    {
        private INumberOfNewClientsRepository NumberOfNewClientsRespository; public NumberOfNewClientsBL()
        {
            NumberOfNewClientsRespository = new NumberOfNewClientsRespository();
        }
        public NumberOfNewClientsBL(INumberOfNewClientsRepository NumberOfNewClientsRespository)
        {
            this.NumberOfNewClientsRespository = NumberOfNewClientsRespository;
        }
        public List<GetNumberOfNewClients_Result> GetNumberOfNewClients(DateTime start, DateTime end, int branchRef, int TimeType)
        {
            return NumberOfNewClientsRespository.GetNumberOfNewClients(start, end, branchRef, TimeType);
        }
        private bool disposedValue = false; protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    NumberOfNewClientsRespository.Dispose();
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