using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
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

        public List<Visita> FindAll(string fechaIni, string fechaFin, string dniProspecto, string nombreProspecto)
        {
            var query = _db.Visita.AsQueryable();

            if (!string.IsNullOrWhiteSpace(dniProspecto))
                query = query.Where(p => p.Prospecto.Num_DNI.Contains(dniProspecto));

            if (!string.IsNullOrWhiteSpace(nombreProspecto))
                query =
                    query.Where(
                        p =>
                            p.Prospecto.Txt_Pros.Contains(nombreProspecto) ||
                            p.Prospecto.Txt_Ape_Pat.Contains(nombreProspecto) ||
                            p.Prospecto.Txt_Ape_Mat.Contains(nombreProspecto));

            if (!string.IsNullOrWhiteSpace(fechaIni))
            {
                DateTime value;
                var esValida = DateTime.TryParse(fechaIni, out value);

                if (esValida)
                    query = query.Where(p => DbFunctions.DiffDays(p.Fec_Ini, value).Value == 0);
            }

            if (!string.IsNullOrWhiteSpace(fechaFin))
            {
                DateTime value;
                var esValida = DateTime.TryParse(fechaFin, out value);

                if (esValida)
                    query = query.Where(p => DbFunctions.DiffDays(p.Fec_Fin, value).Value == 0);
            }

            return query.ToList();
        }

        public Visita Get(int id)
        {
            return _db.Visita.Find(id);
        }

        public IList<TipoVisita> TipoVisitasAll()
        {
            return _db.TipoVisita.ToList();
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