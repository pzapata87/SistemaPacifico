using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CanalVentaBusiness
    {
         private readonly BDPacificoEntities1 _db;

         public CanalVentaBusiness()
        {
            _db = new BDPacificoEntities1();
        }

         public IDbSet<CanalVenta> FindAll()
         {
             return _db.CanalVenta;
         }
    }
}