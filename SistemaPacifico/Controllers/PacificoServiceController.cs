using Pacifico.Bussines;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaPacifico.Controllers
{
    public class PacificoServiceController : Controller
    {
        private readonly PropuestaSolucionBusiness _business;
        public PacificoServiceController()
        {
            _business = new PropuestaSolucionBusiness();
        }

        public JsonResult ObtenerProspecto(string numeroDNI)
        {
            var dbProspecto = _business.ObtenerProspecto(numeroDNI);
            if(dbProspecto!=null)
                return Json(new { Co_Prospecto=dbProspecto.Co_Prospecto, No_Prospecto = dbProspecto.No_Prospecto, Tx_ApePaterno = dbProspecto.Tx_ApePaterno, Tx_ApeMaterno = dbProspecto.Tx_ApeMaterno }, JsonRequestBehavior.AllowGet);
            else
                return Json(new { Co_Prospecto = "" }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPlanProducto(int codigoProducto)
        {
            var dbPlanProductos = new PropuestaSolucionBusiness().ListarPlanProducto(codigoProducto).Select(x=> new { Codigo = x.Co_PlanProducto, Value = x.No_PlanProducto});
            return Json(dbPlanProductos, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerDetalle(double montoPrima)
        {
            var detalle = new PropuestaSolucionBusiness().GenerarDetallePropuesta(montoPrima).ToList();
            return Json(detalle, JsonRequestBehavior.AllowGet);
        }
    }
}