using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class UpdateIsAdminStatusBL : IDisposable
    {
        private IUpdateIsAdminStatusRepo updateIsAdminStatusRepo;

        public UpdateIsAdminStatusBL()
        {
            updateIsAdminStatusRepo = new UpdateIsAdminStatusRepo();
        }

        public UpdateIsAdminStatusBL(IUpdateIsAdminStatusRepo updateIsAdminStatusRepo)
        {
            this.updateIsAdminStatusRepo = updateIsAdminStatusRepo;
        }

        public void usp_UpdateIsAdminStatus(string userName, string status)
        {
            updateIsAdminStatusRepo.usp_UpdateIsAdminStatus(userName, status);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    updateIsAdminStatusRepo.Dispose();
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