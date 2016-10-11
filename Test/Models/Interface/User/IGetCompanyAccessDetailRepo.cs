using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IGetCompanyAccessDetailRepo : IDisposable
    {
        List<usp_GetCompanyAccessDetail_Result> usp_GetCompanyAccessDetail(long companyRef);
    }
}
