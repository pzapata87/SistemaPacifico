using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class ComisionBusiness
    {
         private readonly BDPacificoEntities1 _db;

         public ComisionBusiness()
        {
            _db = new BDPacificoEntities1();
        }

         public IDbSet<Comision> FindAll()
         {
             return _db.Comision;
         }

         public Comision Add(Comision comision)
         {
             try
             {
                 comision = _db.Comision.Add(comision);
                 _db.SaveChanges();

                 return comision;
             }
             catch (Exception ex)
             {
                 throw ex;
             }
         }
    }
}