using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{
    public class ComisionBusiness
    {
        private readonly BDPacificoEntities _db;

        public ComisionBusiness()
        {
            _db = new BDPacificoEntities();
        }

        public IDbSet<Comision> FindAll()
        {
            return _db.Comision;
        }

        public List<Comision> FindAll(string nombreComision, string canalVenta, string campania)
        {
            var query = _db.Comision.AsQueryable();

            if (!string.IsNullOrWhiteSpace(nombreComision))
                query = query.Where(p => p.Nro_Com.Contains(nombreComision));

            if (!string.IsNullOrWhiteSpace(canalVenta))
                query = query.Where(p => p.CanalVenta.Nro_Cnl_Vta.Contains(canalVenta));

            if (!string.IsNullOrWhiteSpace(campania))
                query = query.Where(p => p.Campania.Nro_Camp.Contains(campania));

            return query.OrderByDescending(p => p.Cod_Com).ToList();
        }

        public Comision Get(int id)
        {
            return _db.Comision.Find(id);
        }

        public void EliminarRango(Rango rango)
        {
            _db.Rango.Remove(rango);
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

        public Comision Update(Comision comision)
        {
            try
            {
                _db.Comision.AddOrUpdate(comision);
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