using System;
using System.Collections.Generic;
using System.Linq;
using Pacifico.Bussines;
using System.Web.Mvc;
using SistemaPacifico.Models;
using Pacifico.DataAccess;

namespace SistemaPacifico.Controllers
{
    public class PropuestaSolucionController : Controller
    {
        public ActionResult Index()
        {
            var propuestaSolucion = new PropuestaSolucionBusiness().ListarPropuestaSolucion().ToList();
            var propuestaVm = propuestaSolucion.ConvertAll(p => new PropuestaSolucionViewModel
            {
                Codigo = p.Co_PropuestaSolucion,
                DNIProspecto = p.Prospecto.Nu_DNI,
                NombreProspecto = p.Prospecto.No_Prospecto,
                FechaNacimiento = p.Fe_Nacimiento.ToShortDateString(),
                FechaRegistro = p.Fe_Creacion.ToShortDateString(),
                MontoAsegurado = p.Ss_MontoAsegurado,
                MontoPrima = p.Ss_MontoPrima,
                MontoRetorno = p.Ss_MontoRetorno
            });
            return View(propuestaVm);
        }

        [HttpPost]
        public ActionResult Index(int? numeroPropuesta, string fecha, string dni, string nombre)
        {
            var propuestaSolucion = new PropuestaSolucionBusiness().ListarPropuestaSolucion(
                numeroPropuesta, fecha, dni, nombre).ToList();

            ViewBag.ParamCodigo = numeroPropuesta;
            ViewBag.ParamFecha = fecha;
            ViewBag.ParamDni = dni;
            ViewBag.ParamNombre = nombre;

            var propuestaVm = propuestaSolucion.ConvertAll(p => new PropuestaSolucionViewModel
            {
                Codigo = p.Co_PropuestaSolucion,
                DNIProspecto = p.Prospecto.Nu_DNI,
                NombreProspecto = p.Prospecto.No_Prospecto,
                FechaNacimiento = p.Fe_Nacimiento.ToShortDateString(),
                FechaRegistro = p.Fe_Creacion.ToShortDateString(),
                MontoAsegurado = p.Ss_MontoAsegurado,
                MontoPrima = p.Ss_MontoPrima,
                MontoRetorno = p.Ss_MontoRetorno
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
                DNIProspecto = propuesta.Prospecto.Nu_DNI,
                NombreProspecto = propuesta.Prospecto.No_Prospecto,
                ApellidoProspecto = propuesta.Prospecto.Tx_ApePaterno + " " + propuesta.Prospecto.Tx_ApeMaterno,
                FechaNacimiento = propuesta.Fe_Nacimiento.ToString("dd/MM/yyyy"),
                Productos = ObtenerProductos(),
                PlanProductos = ObtenerPlanProducto(propuesta.Co_Plan),
                MontoAsegurado = propuesta.Ss_MontoAsegurado,
                MontoRetorno = propuesta.Ss_MontoRetorno,
                MontoPrima = propuesta.Ss_MontoPrima,
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
                Co_Prospecto = model.CodigoProspecto,
                Fe_Nacimiento = Convert.ToDateTime(model.FechaNacimiento),
                Co_Producto = model.CodigoProducto,
                Co_Plan = model.CodigoPlan,
                Ss_MontoAsegurado = model.MontoAsegurado.GetValueOrDefault(),
                Ss_MontoRetorno = model.MontoRetorno.GetValueOrDefault(),
                Ss_MontoPrima = model.MontoPrima.GetValueOrDefault(),
                Fe_Creacion = DateTime.Now
            };
            new PropuestaSolucionBusiness().RegistrarPropuestaSolucion(propuesta,model.Detalle);
            return Json(Url.Action("Index", "PropuestaSolucion"));
        }

        private SelectList ObtenerProductos()
        {
            var dbProductos = new PropuestaSolucionBusiness().ListarProducto();
            dbProductos.Add(new Producto { Co_Producto = 0 , No_Producto = "[SELECCIONAR]"});
            var productos = dbProductos
                        .Select(x =>
                                new SelectListItem
                                {
                                    Value = x.Co_Producto.ToString(),
                                    Text = x.No_Producto
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
                                    Value = x.Co_PlanProducto.ToString(),
                                    Text = x.No_PlanProducto
                                });
            return new SelectList(plan, "Value", "Text");
        }
	}
}