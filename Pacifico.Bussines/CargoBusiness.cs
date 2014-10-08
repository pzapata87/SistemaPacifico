using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CargoBusiness
    {
         private readonly BDPacificoEntities1 _db;

         public CargoBusiness()
        {
            _db = new BDPacificoEntities1();
        }

         public IDbSet<Cargo> FindAll()
         {
             return _db.Cargo;
         }
    }
}