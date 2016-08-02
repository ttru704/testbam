using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface ILargeAnimalsComRepo: IDisposable
    {
        List<usp_LargeAnimalsCom_Result> usp_LargeAnimalsCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
