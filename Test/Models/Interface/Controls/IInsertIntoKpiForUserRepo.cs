﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface.Controls
{
    public interface IInsertIntoKpiForUserRepo:IDisposable
    {
        void usp_InsertIntoKpiForUser(int kpiRef, string userRef);
    }
}
