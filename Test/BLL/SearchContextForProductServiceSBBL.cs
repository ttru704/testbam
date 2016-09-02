using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.Models;
using Test.Models.Interface;
using Test.Models.Repository;

namespace Test.BLL
{
    public class SearchContextForProductServiceSBBL :IDisposable
    {
        private ISearchContextForProductServiceSBRepo SearchContextForProductServiceSBRepo;

        public SearchContextForProductServiceSBBL()
        {
            SearchContextForProductServiceSBRepo = new SearchContextForProductServiceSBRepo();
        }

        public SearchContextForProductServiceSBBL(ISearchContextForProductServiceSBRepo SearchContextForProductServiceSBRepo)
        {
            this.SearchContextForProductServiceSBRepo = SearchContextForProductServiceSBRepo;
        }

        public List<usp_SearchContextForProductServiceSB_Result> usp_SearchContextForProductServiceSB()
        {
            return SearchContextForProductServiceSBRepo.usp_SearchContextForProductServiceSB();
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    SearchContextForProductServiceSBRepo.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}