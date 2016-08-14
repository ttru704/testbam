using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenCompanyRepo: IDisposable
    {
        List<usp_AnimalsSeenCompany_Result> usp_AnimalsSeenCompany(DateTime start, DateTime end, int companyRef, int timeType);
    }
}
