using System.Data.Entity;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class CanalVentaBusiness
    {
         private readonly BDPacificoEntities _db;

         public CanalVentaBusiness()
        {
            _db = new BDPacificoEntities();
        }

         public IDbSet<CanalVenta> FindAll()
         {
             return _db.CanalVenta;
         }
    }
}