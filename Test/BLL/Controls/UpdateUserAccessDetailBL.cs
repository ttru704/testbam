using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;

namespace Test.BLL.Controls
{
    public class UpdateUserAccessDetailBL : IDisposable
    {
        private IUpdateUserAccessDetailRepo updateUserAccessDetailRepo;

        public UpdateUserAccessDetailBL()
        {
            updateUserAccessDetailRepo = new UpdateUserAccessDetailRepo();
        }

        public UpdateUserAccessDetailBL(IUpdateUserAccessDetailRepo updateUserAccessDetailRepo)
        {
            this.updateUserAccessDetailRepo = updateUserAccessDetailRepo;
        }

        public void usp_UpdateUserAccessDetail(DateTime accessStart, DateTime accessEnd, int status, string userRef)
        {
            updateUserAccessDetailRepo.usp_UpdateUserAccessDetail(accessStart, accessEnd, status, userRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    updateUserAccessDetailRepo.Dispose();
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