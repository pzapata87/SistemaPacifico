using System;
using System.Linq;
using Pacifico.Bussines;
using System.Web.Mvc;
using SistemaPacifico.Core;
using SistemaPacifico.Models;
using Pacifico.DataAccess;
using Stimulsoft.Report;
using Stimulsoft.Report.Mvc;

namespace SistemaPacifico.Controllers
{
    public class PropuestaSolucionController : ReportBaseController
    {
        public ActionResult Index()
        {
            var propuestaSolucion = new PropuestaSolucionBusiness().ListarPropuestaSolucion().ToList();
            var propuestaVm = propuestaSolucion.ConvertAll(p => new PropuestaSolucionViewModel
            {
                Codigo = p.Cod_Prop_Sol,
                DNIProspecto = p.Prospecto.Num_DNI,
                NombreProspecto = p.Prospecto.Txt_Pros,
                FechaNacimiento = p.Fec_Nac.ToShortDateString(),
                FechaRegistro = p.Fec_Crea.ToShortDateString(),
                MontoAsegurado = p.Ss_Mon_Aseg,
                MontoPrima = p.Ss_Mon_Prim,
                MontoRetorno = p.Ss_Mon_Ret
            });
            return View(propuestaVm);
        }

        [HttpPost]
        public ActionResult Index(int? numeroPropuesta, string fecha, string dni, string nombre)
        {
            //string vFecha = "2015/02/03";

            var propuestaSolucion = new PropuestaSolucionBusiness().ListarPropuestaSolucion(
                numeroPropuesta, fecha, dni, nombre).ToList();

            ViewBag.ParamCodigo = numeroPropuesta;
            ViewBag.ParamFecha = fecha;
            ViewBag.ParamDni = dni;
            ViewBag.ParamNombre = nombre;

            var propuestaVm = propuestaSolucion.ConvertAll(p => new PropuestaSolucionViewModel
            {
                Codigo = p.Cod_Prop_Sol,
                DNIProspecto = p.Prospecto.Num_DNI,
                NombreProspecto = p.Prospecto.Txt_Pros,
                FechaNacimiento = p.Fec_Nac.ToShortDateString(),
                FechaRegistro = p.Fec_Crea.ToShortDateString(),
                MontoAsegurado = p.Ss_Mon_Aseg,
                MontoPrima = p.Ss_Mon_Prim,
                MontoRetorno = p.Ss_Mon_Ret
            });

            return View("Index", propuestaVm);
        }

        public ActionResult CrearPropuesta()
        {
            var model = new PropuestaSolucionViewModel
            {
                Productos = ObtenerProductos().OrderBy(x=>x.Value),
                PlanProductos = ObtenerPlanProducto(0),
            };
            return View(model);
        }

        public ActionResult EditarPropuesta(int id)
        {
            var propuesta = new PropuestaSolucionBusiness().ObtenerPropuestaSolucion(id);

            var model = new PropuestaSolucionViewModel
            {
                Codigo = id,
                DNIProspecto = propuesta.Prospecto.Num_DNI,
                NombreProspecto = propuesta.Prospecto.Txt_Pros,
                ApellidoProspecto = propuesta.Prospecto.Txt_Ape_Pat + " " + propuesta.Prospecto.Txt_Ape_Mat,
                FechaNacimiento = propuesta.Fec_Nac.GetDate(),
                Productos = BuscarProducto(propuesta.Cod_Prod),
                PlanProductos = ObtenerPlanProducto(propuesta.Cod_Plan),
                MontoAsegurado = propuesta.Ss_Mon_Aseg,
                MontoRetorno = propuesta.Ss_Mon_Ret,
                MontoPrima = propuesta.Ss_Mon_Prim,
                Detalle = propuesta.DetallePropuestaSolucion.ToList()
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult ObtenerPropuesta(int id)
        {
            var propuesta = new PropuestaSolucionBusiness().ObtenerPropuestaSolucion(id);
            
            propuesta.DetallePropuestaSolucion.ToList().ForEach(d => { d.PropuestaSolucion = null; });

            return Json(propuesta.DetallePropuestaSolucion);
        }

        [HttpPost]
        public ActionResult CrearPropuesta(PropuestaSolucionViewModel model)
        {
            var propuesta = new PropuestaSolucion
            {
                Cod_Pros = model.CodigoProspecto,
                Fec_Nac = Convert.ToDateTime(model.FechaNacimiento),
                Cod_Prod = model.CodigoProducto,
                Cod_Plan = model.CodigoPlan,
                Ss_Mon_Aseg = model.MontoAsegurado.GetValueOrDefault(),
                Ss_Mon_Ret = model.MontoRetorno.GetValueOrDefault(),
                Ss_Mon_Prim = model.MontoPrima.GetValueOrDefault(),
                Fec_Crea = DateTime.Now
            };
            new PropuestaSolucionBusiness().RegistrarPropuestaSolucion(propuesta,model.Detalle);
            return Json(Url.Action("Index", "PropuestaSolucion"));
        }

        private SelectList ObtenerProductos()
        {
            var dbProductos = new PropuestaSolucionBusiness().ListarProducto();
            dbProductos.Add(new Producto { Cod_Prod = 0 , Nro_Prod = "[SELECCIONAR]"});
            var productos = dbProductos
                        .Select(x =>
                                new SelectListItem
                                {
                                    Value = x.Cod_Prod.ToString(),
                                    Text = x.Nro_Prod
                                });

            return new SelectList(productos, "Value", "Text");
        }

        private SelectList BuscarProducto(int codigo)
        {
            var dbProductos = new PropuestaSolucionBusiness().ListarProductoxCodigo(codigo);
            var productos = dbProductos
                        .Select(x =>
                                new SelectListItem
                                {
                                    Value = x.Cod_Prod.ToString(),
                                    Text = x.Nro_Prod
                                });

            return new SelectList(productos, "Value", "Text");
        }

        private SelectList ObtenerPlanProducto(int codigoProducto)
        {
            var dbPlanProductos = new PropuestaSolucionBusiness().ListarPlanProducto(codigoProducto);
            var plan = dbPlanProductos
                        .Select(x =>
                                new SelectListItem
                                {
                                    Value = x.Cod_Plan_Prod.ToString(),
                                    Text = x.Nro_Plan_Prod
                                });
            return new SelectList(plan, "Value", "Text");
        }

        public override ActionResult GerReportSnapshot()
        {
            var id = Convert.ToInt32(ParametrosReport["Id"]);

            var propuesta = new PropuestaSolucionBusiness().ObtenerPropuestaSolucion(id);

            var datos = new PropuestaSolucionViewModel
            {
                Codigo = id,
                DNIProspecto = propuesta.Prospecto.Num_DNI,
                NombreProspecto = propuesta.Prospecto.Txt_Pros,
                ApellidoProspecto = propuesta.Prospecto.Txt_Ape_Pat + " " + propuesta.Prospecto.Txt_Ape_Mat,
                FechaNacimiento = propuesta.Fec_Nac.GetDate(),
                NombreProducto = propuesta.Producto.Nro_Prod,
                CodigoPlan = propuesta.Cod_Plan,
                MontoAsegurado = propuesta.Ss_Mon_Aseg,
                MontoRetorno = propuesta.Ss_Mon_Ret,
                MontoPrima = propuesta.Ss_Mon_Prim
            };

            var report = new StiReport();
            report.Load(Server.MapPath("~/Reports/Report.mrt"));
            report.RegBusinessObject("PropuestaSolucion", "PropuestaSolucion", datos);

            return StiMvcViewer.GetReportSnapshotResult(HttpContext, report);
        }
	}
}