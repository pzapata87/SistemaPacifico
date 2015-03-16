using System;
using System.IO;
using System.Linq;
using Pacifico.Bussines;
using System.Web.Mvc;
using SistemaPacifico.Core;
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
                Fec_Crea = DateTime.Now,
                DetallePropuestaSolucion = model.Detalle
            };

            new PropuestaSolucionBusiness().RegistrarPropuestaSolucion(propuesta);
            return Json(Url.Action("Index", "PropuestaSolucion"));
        }

        [HttpPost]
        public virtual JsonResult ExportarToExcel(int id)
        {
            var jsonResponse = new JsonResponse { Success = false };
            try
            {
                var propuesta = new PropuestaSolucionBusiness().ObtenerPropuestaSolucion(id);
                var plan = new PropuestaSolucionBusiness().ObtenerPlanProducto(propuesta.Cod_Plan);

                string nombreFile = string.Format("PropuestaSolucion{0:yyyyMMddHHmmss}.xls", DateTime.Now);
                string pathRead = Server.MapPath(@"~\Content\TemplateExcel\Template.xls");
                string pathWrite = Server.MapPath(@"~\Content\TemplateExcel\" + nombreFile);

                var template = new FileStream(pathRead, FileMode.Open, FileAccess.Read);
                var excel = new GenericExcel(template, "Propuesta Solucion");

                excel.ChangeCell(2, 2, propuesta.Prospecto.Num_DNI);
                excel.ChangeCell(2, 5, propuesta.Fec_Nac.GetDate());
                excel.ChangeCell(3, 2, propuesta.Prospecto.Txt_Pros);
                excel.ChangeCell(3, 5, string.Format("{0} {1}", propuesta.Prospecto.Txt_Ape_Pat, propuesta.Prospecto.Txt_Ape_Mat));
                excel.ChangeCell(4, 2, propuesta.Producto.Nro_Prod);
                excel.ChangeCell(4, 5, plan.Nro_Plan_Prod);
                excel.ChangeCell(5, 2, Convert.ToDouble(propuesta.Ss_Mon_Aseg));
                excel.ChangeCell(5, 5, Convert.ToDouble(propuesta.Ss_Mon_Prim));
                excel.ChangeCell(6, 2, Convert.ToDouble(propuesta.Ss_Mon_Ret));

                int rowNumber = 9;

                foreach (var detalle in propuesta.DetallePropuestaSolucion)
                {
                    excel.CopyRow(rowNumber, rowNumber + 1);

                    excel.ChangeCell(rowNumber, 1, detalle.Num_Anio);
                    excel.ChangeCell(rowNumber, 2, detalle.Num_Edad);
                    excel.ChangeCell(rowNumber, 3, Convert.ToDouble(detalle.Ss_Mon_Prim));
                    excel.ChangeCell(rowNumber, 4, Convert.ToDouble(detalle.Ss_Mon_Ahr));
                    excel.ChangeCell(rowNumber, 5, Convert.ToDouble(detalle.Ss_Val_Resc));
                    excel.ChangeCell(rowNumber, 6, Convert.ToDouble(detalle.Ss_Mon_Aseg));

                    rowNumber++;
                }

                excel.RemoveRow(rowNumber);

                using (var file = new FileStream(pathWrite, FileMode.Create, FileAccess.Write))
                {
                    excel.WorkBook.Write(file);
                }

                jsonResponse.Success = true;
                jsonResponse.Data = Utils.AbsoluteWebRoot + @"Content\TemplateExcel\" + nombreFile;
            }
            catch (Exception ex)
            {

            }

            return Json(jsonResponse, JsonRequestBehavior.AllowGet);
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
	}
}