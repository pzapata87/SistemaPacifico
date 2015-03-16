using System;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class VisitaBusiness
    {
        private readonly BDPacificoEntities _db;

        public VisitaBusiness()
        {
            _db = new BDPacificoEntities();
        }

        public IDbSet<Visita> FindAll()
        {
            return _db.Visita;
        }

        public Visita Add(Visita visita)
        {
            try
            {
                visita = _db.Visita.Add(visita);
                _db.SaveChanges();

                return visita;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Visita Update(Visita visita)
        {
            try
            {
                _db.Visita.AddOrUpdate(visita);
                _db.SaveChanges();

                return visita;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}