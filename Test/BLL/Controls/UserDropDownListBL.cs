using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Controls;
using Test.Models.Repository.Controls;
namespace Test.BLL.Controls
{
    public class UserDropDownListBL : IDisposable
    {
        private IUserDropDownListRepo UserDropDownListRepo;

        public UserDropDownListBL()
        {
            UserDropDownListRepo = new UserDropDownListRepo();
        }

        public UserDropDownListBL(IUserDropDownListRepo UserDropDownListRepo)
        {
            this.UserDropDownListRepo = UserDropDownListRepo;
        }

        public List<usp_UserDropDownList_Result> usp_UserDropDownList(long companyRef)
        {
            return UserDropDownListRepo.usp_UserDropDownList(companyRef);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    UserDropDownListRepo.Dispose();
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