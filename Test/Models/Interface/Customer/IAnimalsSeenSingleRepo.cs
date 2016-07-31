using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenSingleRepo : IDisposable
    {
        double? usp_AnimalsSeenSingle(int companyRef);
    }
}
