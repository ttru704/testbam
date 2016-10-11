using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.User
{
    public interface IUpdateCompanyAccessDetailRepo : IDisposable
    {
        void usp_UpdateCompanyAccessDetail(DateTime accessStart, DateTime accessEnd, long companyRef);
    }
}
