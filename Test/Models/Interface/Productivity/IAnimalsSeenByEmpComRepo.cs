using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Productivity
{
    public interface IAnimalsSeenByEmpComRepo : IDisposable
    {
        List<usp_AnimalsSeenByEmpCom_Result> usp_AnimalsSeenByEmpCom(DateTime start, DateTime end, int companyRef, int timeType);

    }
}
