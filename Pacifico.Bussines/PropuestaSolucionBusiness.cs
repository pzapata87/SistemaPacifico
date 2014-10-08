using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{

    public class PropuestaSolucionBusiness
    {
        private readonly BDPacificoEntities1 _db;

        public PropuestaSolucionBusiness()
        {
            _db = new BDPacificoEntities1();
        }

        public IList<PropuestaSolucion> ListarPropuestaSolucion()
        {
            return _db.PropuestaSolucion.ToList();
        }

        public IList<PropuestaSolucion> ListarPropuestaSolucion(
            int? numero, string fechaRegistro, string dni, string nombre)
        {
            var query = _db.PropuestaSolucion.AsQueryable();

            if (numero.HasValue)
                query = query.Where(x => x.Co_PropuestaSolucion == numero.Value);

            if (!string.IsNullOrWhiteSpace(fechaRegistro))
                query = query.Where(x => x.Fe_Creacion.ToShortDateString().Contains(fechaRegistro));

            if (!string.IsNullOrWhiteSpace(dni))
                query = query.Where(x => x.Prospecto.Nu_DNI == dni);

            if (!string.IsNullOrWhiteSpace(nombre))
                query = query.Where(x => x.Prospecto.No_Prospecto.Contains(nombre));
            
            return query.ToList();
        }

        public IList<Producto> ListarProducto()
        {
            return _db.Producto.ToList();
        }

        public IList<PlanProducto> ListarPlanProducto(int codigoProducto)
        {
            return _db.PlanProducto.Where(x => x.Co_Producto == codigoProducto).ToList();
        }

        public PropuestaSolucion RegistrarPropuestaSolucion(PropuestaSolucion propuesta, List<DetallePropuestaSolucion> detalle)
        {
            try
            {
                var newPropuesta = _db.PropuestaSolucion.Add(propuesta);
                _db.SaveChanges();

                for (int i = 0; i < detalle.Count; i++)
                {
                    detalle[i].Co_PropuestaSolucion = newPropuesta.Co_PropuestaSolucion;
                    _db.DetallePropuestaSolucion.Add(detalle[i]);
                }
                _db.SaveChanges();
                return newPropuesta;
            }
            catch (Exception ex)
            {          
                throw ex;
            }
        }
        public PropuestaSolucion ObtenerPropuestaSolucion(int id)
        {
            return _db.PropuestaSolucion.SingleOrDefault(x => x.Co_PropuestaSolucion == id);
        }

        public Prospecto ObtenerProspecto(string numeroDNI)
        {
            return _db.Prospecto.SingleOrDefault(x => x.Nu_DNI == numeroDNI);
        }

        public List<DetallePropuestaSolucion> GenerarDetallePropuesta(double montoPrima)
        {
            List<DetallePropuestaSolucion> lst = new List<DetallePropuestaSolucion>();

            for (int i = 0; i < 30; i++)
            {
                lst.Add(new DetallePropuestaSolucion 
                { 
                    Nu_Anio = i, 
                    Nu_Edad = edad + 1,
                    Ss_MontoPrima = Convert.ToDecimal(montoPrima), 
                    Ss_MontoAhorro = Convert.ToDecimal(montoPrima * 0.05),
                    Ss_ValorRescate = 50,
                    Ss_MontoAsegurado = Convert.ToDecimal(montoAsegurado)
                });
            }

            return lst;
        }
    }
}