using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CampaniaBusiness
    {
         private readonly BDPacificoEntities1 _db;

         public CampaniaBusiness()
        {
            _db = new BDPacificoEntities1();
        }

         public IDbSet<Campania> FindAll()
         {
             return _db.Campania;
         }
    }
}