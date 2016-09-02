﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Models.Interface
{
    public interface IBranchTypeDropDownListRepo:IDisposable
    {
        List<usp_BranchTypeDropDownList_Result> usp_BranchTypeDropDownList(int? businessType);
    }
}
