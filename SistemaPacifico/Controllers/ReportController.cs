using System.Collections.Generic;
using System.Web.Mvc;

namespace SistemaPacifico.Controllers
{
    public class ReportController : Controller
    {
        [HttpPost]
        public ActionResult StimulsoftControl(string controllerGetSnapshot, Dictionary<string, string> parametros)
        {
            TempData["Parametros"] = parametros;
            ViewData["ControllerGetSnapshot"] = controllerGetSnapshot;

            return PartialView();
        }
    }
}
