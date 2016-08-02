using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ISmallAnimalsComRepo: IDisposable
    {
        List<usp_SmallAnimalsCom_Result> usp_SmallAnimalsCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
