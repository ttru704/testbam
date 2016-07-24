using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface INewClientsComRepo: IDisposable
    {
        List<usp_NewClientsCom_Result> usp_NewClientsCom(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
