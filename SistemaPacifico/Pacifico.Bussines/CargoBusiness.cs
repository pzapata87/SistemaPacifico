using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CargoBusiness
    {
         private readonly BDPacificoEntities _db;

         public CargoBusiness()
        {
            _db = new BDPacificoEntities();
        }

         public IDbSet<Cargo> FindAll()
         {
             return _db.Cargo;
         }
    }
}