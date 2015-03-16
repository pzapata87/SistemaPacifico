using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Pacifico.DataAccess;

namespace Pacifico.Bussines
{

    public class PropuestaSolucionBusiness
    {
        private readonly BDPacificoEntities _db;

        public PropuestaSolucionBusiness()
        {
            _db = new BDPacificoEntities();
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
                query = query.Where(x => x.Cod_Prop_Sol == numero.Value);

            if (!string.IsNullOrWhiteSpace(fechaRegistro))
            {
                //query = query.Where(x => x.Fe_Creacion.ToShortDateString().Contains(fechaRegistro));
                DateTime vFechaRegistro = Convert.ToDateTime(fechaRegistro);
                query = query.Where(x => DbFunctions.DiffDays(x.Fec_Crea, vFechaRegistro).Value == 0);
            }

            if (!string.IsNullOrWhiteSpace(dni))
                query = query.Where(x => x.Prospecto.Num_DNI == dni);

            if (!string.IsNullOrWhiteSpace(nombre))
                query = query.Where(x => x.Prospecto.Txt_Pros.Contains(nombre));
            
            return query.ToList();
        }

        public IList<Producto> ListarProductoxCodigo(int codigo)
        {
            return _db.Producto.Where(x=>x.Cod_Prod == codigo).ToList();
        }

        public IList<Producto> ListarProducto()
        {
            return _db.Producto.ToList();
        }

        public IList<PlanProducto> ListarPlanProducto(int codigoProducto)
        {
            return _db.PlanProducto.Where(x => x.Cod_Prod == codigoProducto).ToList();
        }

        public PlanProducto ObtenerPlanProducto(int codPlanProducto)
        {
            return _db.PlanProducto.FirstOrDefault(x => x.Cod_Plan_Prod == codPlanProducto);
        }

        public PropuestaSolucion RegistrarPropuestaSolucion(PropuestaSolucion propuesta)
        {
            try
            {
                var newPropuesta = _db.PropuestaSolucion.Add(propuesta);
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
            return _db.PropuestaSolucion.SingleOrDefault(x => x.Cod_Prop_Sol == id);
        }

        public Prospecto ObtenerProspecto(string numeroDNI)
        {
            return _db.Prospecto.SingleOrDefault(x => x.Num_DNI == numeroDNI);
        }

        public List<DetallePropuestaSolucion> GenerarDetallePropuesta(double montoAsegurado, int edad)
        {
            const int edadLimite = 65;
            double primaAnual = montoAsegurado * 0.009;
            double montoPrima = primaAnual;
            double montoAhorro = montoPrima * 0.05;
            double valRescate = montoAhorro;
            double montoCalcAsegurado = montoAsegurado + (montoAsegurado * 0.0005);

            var lst = new List<DetallePropuestaSolucion>();

            for (int i = 0; i <= edadLimite - edad ; i++)
            {
                if (i > 0)
                {
                    montoPrima += primaAnual + 1;
                    montoAhorro = montoPrima * 0.05;
                    montoCalcAsegurado = montoCalcAsegurado + (montoCalcAsegurado * 0.0005);

                    if (i == 2)
                    {
                        valRescate = (valRescate + montoAhorro) * 4;
                    }
                    else
                    {
                        valRescate = (valRescate + montoAhorro) * 1.035;
                    }
                }

                lst.Add(new DetallePropuestaSolucion
                {
                    Num_Anio = i + 1,
                    Num_Edad = edad + i,
                    Ss_Mon_Prim = Convert.ToDecimal(montoPrima),
                    Ss_Mon_Ahr = Convert.ToDecimal(montoAhorro),
                    Ss_Val_Resc = Convert.ToDecimal(valRescate),
                    Ss_Mon_Aseg = Convert.ToDecimal(montoCalcAsegurado)
                });
            }

            return lst;
        }
    }
}