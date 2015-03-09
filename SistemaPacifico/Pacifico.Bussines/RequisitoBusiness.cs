using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class RequisitoBusiness
    {
         private readonly BDPacificoEntities _db;

         public RequisitoBusiness()
        {
            _db = new BDPacificoEntities();
        }

         public IDbSet<Requisito> FindAll()
         {
             return _db.Requisito;
         }
    }
}