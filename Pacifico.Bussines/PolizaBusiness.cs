using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class PolizaBusiness
    {
        private readonly BDPacificoEntities _db;

        public PolizaBusiness()
        {
            _db = new BDPacificoEntities();
        }

        public IDbSet<Poliza> FindAll()
        {
            return _db.Poliza;
        }

        public List<Poliza> FindAll(string numSolicitud, string fechaIngreso, decimal monto)
        {
            var query = _db.Poliza.AsQueryable();

            if (!string.IsNullOrWhiteSpace(numSolicitud))
                query = query.Where(p => p.Nu_Poliza == numSolicitud);

            if (!string.IsNullOrWhiteSpace(fechaIngreso))
            {
                DateTime value;
                var esValida = DateTime.TryParse(fechaIngreso, out value);

                if (esValida)
                    query = query.Where(p => DbFunctions.DiffDays(p.Fe_Creacion, value).Value == 0);
            }

            return query.OrderByDescending(p => p.Co_Poliza).ToList();
        }

        public IList<TipoPlan> TipoPlanAll()
        {
            return _db.TipoPlan.ToList();
        }

        public Poliza Get(int id)
        {
            return _db.Poliza.Find(id);
        }


        public Poliza Add(Poliza poliza)
        {
            try
            {
                poliza = _db.Poliza.Add(poliza);
                _db.SaveChanges();

                return poliza;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Poliza Update(Poliza poliza)
        {
            try
            {
                _db.Poliza.AddOrUpdate(poliza);
                _db.SaveChanges();

                return poliza;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}