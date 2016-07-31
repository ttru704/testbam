using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Customer
{
    public interface IAnimalsSeenChangesRepo : IDisposable
    {
        double? usp_AnimalsSeenChanges(int companyRef);
    }
}
