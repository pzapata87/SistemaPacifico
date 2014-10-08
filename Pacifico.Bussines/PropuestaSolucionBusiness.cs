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

        public List<DetallePropuestaSolucion> GenerarDetallePropuesta(double montoAsegurado, int edad)
        {
            var primaAnual = Convert.ToDouble(montoAsegurado) * 0.009;
            var primaMensual = primaAnual / 12;
            var montoAhorro = Convert.ToDouble(primaAnual) * 0.05;
            var valorRescate = montoAhorro;
            var montoCalcAsegurado =  Convert.ToDouble(montoAsegurado + (montoAsegurado * 0.0005));

            
            List<DetallePropuestaSolucion> lst = new List<DetallePropuestaSolucion>();
            lst.Add(new DetallePropuestaSolucion
            {
                Nu_Anio = 1,
                Nu_Edad = edad,
                Ss_MontoPrima = Convert.ToDecimal(primaAnual),
                Ss_MontoAhorro = Convert.ToDecimal(montoAhorro),
                Ss_ValorRescate = Convert.ToDecimal(montoAhorro),
                Ss_MontoAsegurado = Convert.ToDecimal(montoCalcAsegurado)
            });

            for (int i = 0; i < edad; i++)
            {
                var edadCalc = lst[i].Nu_Edad + 1;
                var anio = lst[i].Nu_Anio + 1;
                var montoPrima = Convert.ToDecimal(Math.Round(lst[i].Ss_MontoPrima,2) + Convert.ToDecimal(Math.Round(primaAnual,2)) + 1);
                var montoAhorroDet = Convert.ToDouble(Math.Round(montoPrima,2)) * 0.05;
                decimal valorRescateDet = 0;
                if (i == 1)
                {
                    valorRescateDet = Convert.ToDecimal(Convert.ToDouble(Math.Round(lst[i].Ss_ValorRescate, 2)) + Convert.ToDouble(Math.Round(montoAhorroDet, 2)) * 4);
                }
                else
                {
                    valorRescateDet = Convert.ToDecimal(Convert.ToDouble(Math.Round(lst[i].Ss_ValorRescate, 2)) + Convert.ToDouble(Math.Round(montoAhorroDet, 2)) * 1.035);
                }
                var montoAseguradoCalc = Convert.ToDouble(lst[i].Ss_MontoAsegurado) + (Convert.ToDouble(lst[i].Ss_MontoAsegurado)*0.0005);


                lst.Add(new DetallePropuestaSolucion {
                    Nu_Edad = edadCalc,
                    Nu_Anio = anio,
                    Ss_MontoPrima = montoPrima,
                    Ss_MontoAhorro = Convert.ToDecimal(montoAhorroDet),
                    Ss_ValorRescate = Math.Round(valorRescateDet,2),
                    Ss_MontoAsegurado = Convert.ToDecimal(Math.Round(montoAseguradoCalc,2))
                });
            }

            return lst;
        }
    }
}