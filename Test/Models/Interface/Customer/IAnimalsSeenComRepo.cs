using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenComRepo: IDisposable
    {
        List<usp_AnimalsSeenCom_Result> usp_AnimalsSeenCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
