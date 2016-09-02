using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Identity
{
    public  interface ICompanyInfoInsertRepo : IDisposable
    {
          void usp_CompanyInfoInsert(int companyNumber, string companyName, int businessType);

    }
}
