﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IDeleteFromKpiForUserRepo : IDisposable
    {
        void usp_DeleteFromKpiForUser(int kpiRef, string userRef);
    }
}
