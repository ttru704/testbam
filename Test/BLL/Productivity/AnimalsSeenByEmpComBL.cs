using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface.Productivity;
using Test.Models.Repository.Productivity;

namespace Test.BLL.Productivity
{
    public class AnimalsSeenByEmpComBL : IDisposable
    {
        private IAnimalsSeenByEmpComRepo animalsSeenByEmpComRepo;

        public AnimalsSeenByEmpComBL()
        {
            animalsSeenByEmpComRepo = new AnimalsSeenByEmpComRepo();
        }

        public AnimalsSeenByEmpComBL(IAnimalsSeenByEmpComRepo animalsSeenByEmpComRepo)
        {
            this.animalsSeenByEmpComRepo = animalsSeenByEmpComRepo;
        }

        public List<usp_AnimalsSeenByEmpCom_Result> usp_AnimalsSeenByEmpCom(DateTime start, DateTime end, int companyRef, int timeType)
        {
            return animalsSeenByEmpComRepo.usp_AnimalsSeenByEmpCom(start, end, companyRef, timeType);
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    animalsSeenByEmpComRepo.Dispose();
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