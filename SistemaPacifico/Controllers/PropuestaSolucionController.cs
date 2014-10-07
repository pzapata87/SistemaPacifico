using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pacifico.Bussines;
using System.Web.Mvc;
using SistemaPacifico.Models;
using Pacifico.DataAccess;
using System.Collections;

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
                FechaRegistro = p.Fe_Creacion,
                MontoAsegurado = p.Ss_MontoAsegurado,
            });
            return View(propuestaVm);
        }

        public ActionResult CrearPropuesta()
        {
            var model = new PropuestaSolucionViewModel
            {
                Productos = ObtenerProductos(),
                PlanProductos = ObtenerPlanProducto(0),
            };
            return View(model);
        }

        public ActionResult EditarPropuesta(int id)
        {
            var propuesta = new PropuestaSolucionBusiness().ObtenerPropuestaSolucion(id);

            var model = new PropuestaSolucionViewModel
            {
                DNIProspecto = propuesta.Prospecto.Nu_DNI,
                NombreProspecto = propuesta.Prospecto.No_Prospecto,
                FechaNacimiento = propuesta.Fe_Nacimiento,
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
        public ActionResult CrearPropuesta(PropuestaSolucionViewModel model)
        {
            var propuesta = new PropuestaSolucion
            {
                Co_Prospecto = model.CodigoProspecto,
                Fe_Nacimiento = model.FechaNacimiento.GetValueOrDefault(),
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
            if (dbPlanProductos.Count > 0)
            {
                var plan = dbPlanProductos
                            .Select(x =>
                                    new SelectListItem
                                    {
                                        Value = x.Co_PlanProducto.ToString(),
                                        Text = x.No_PlanProducto
                                    });
                return new SelectList(plan, "Value", "Text");
            }
            return new SelectList(new List<SelectListItem>() { new SelectListItem { Text = "SELECCIONAR", Value = "0" } }, "Value", "Text");
        }
	}
}