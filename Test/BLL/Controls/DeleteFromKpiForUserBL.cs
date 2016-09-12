using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class DeleteFromKpiForUserBL : IDisposable
    {
        private IDeleteFromKpiForUserRepo deleteFromKpiForUserRepo;

        public DeleteFromKpiForUserBL()
        {
            deleteFromKpiForUserRepo = new DeleteFromKpiForUserRepo();
        }

        public DeleteFromKpiForUserBL(IDeleteFromKpiForUserRepo deleteFromKpiForUserRepo)
        {
            this.deleteFromKpiForUserRepo = deleteFromKpiForUserRepo;
        }

        public void usp_DeleteFromKpiForUser(int kpiRef, string userRef)
        {
            deleteFromKpiForUserRepo.usp_DeleteFromKpiForUser(kpiRef, userRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    deleteFromKpiForUserRepo.Dispose();
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