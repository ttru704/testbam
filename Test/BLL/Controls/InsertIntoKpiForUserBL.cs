using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class InsertIntoKpiForUserBL : IDisposable
    {
        private IInsertIntoKpiForUserRepo insertIntoKpiForUserRepo;

        public InsertIntoKpiForUserBL()
        {
            insertIntoKpiForUserRepo = new InsertIntoKpiForUserRepo();
        }

        public InsertIntoKpiForUserBL(IInsertIntoKpiForUserRepo insertIntoKpiForUserRepo)
        {
            this.insertIntoKpiForUserRepo = insertIntoKpiForUserRepo;
        }

        public void usp_InsertIntoKpiForUser(int kpiRef, string userRef)
        {
            insertIntoKpiForUserRepo.usp_InsertIntoKpiForUser(kpiRef, userRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    insertIntoKpiForUserRepo.Dispose();
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