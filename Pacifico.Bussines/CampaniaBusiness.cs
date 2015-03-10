using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CampaniaBusiness
    {
         private readonly BDPacificoEntities _db;

         public CampaniaBusiness()
        {
            _db = new BDPacificoEntities();
        }

         public IDbSet<Campania> FindAll()
         {
             return _db.Campania;
         }
    }
}