using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class RequisitoBusiness
    {
         private readonly BDPacificoEntities1 _db;

         public RequisitoBusiness()
        {
            _db = new BDPacificoEntities1();
        }

         public IDbSet<Requisito> FindAll()
         {
             return _db.Requisito;
         }
    }
}