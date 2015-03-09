using Pacifico.Bussines;
using System.Linq;
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
            if (dbProspecto != null)
                return
                    Json(
                        new
                        {
                            Co_Prospecto = dbProspecto.Cod_Pros,
                            No_Prospecto = dbProspecto.Txt_Pros,
                            Tx_ApePaterno = dbProspecto.Txt_Ape_Pat,
                            Tx_ApeMaterno = dbProspecto.Txt_Ape_Mat
                        }, JsonRequestBehavior.AllowGet);
            else
                return Json(new {Co_Prospecto = ""}, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPlanProducto(int codigoProducto)
        {
            var dbPlanProductos = new PropuestaSolucionBusiness().ListarPlanProducto(codigoProducto).Select(x=> new { Codigo = x.Cod_Plan_Prod, Value = x.Nro_Plan_Prod});
            return Json(dbPlanProductos, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerDetalle(double montoAsegurado, int edad)
        {
            var detalle = new PropuestaSolucionBusiness().GenerarDetallePropuesta(montoAsegurado, edad).ToList();
            return Json(detalle, JsonRequestBehavior.AllowGet);
        }
    }
}