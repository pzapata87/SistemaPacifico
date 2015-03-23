using System.Collections.Generic;
using System.Web.Mvc;
using SistemaPacifico.Models;

namespace SistemaPacifico.Controllers
{
    public class PolizaController : Controller
    {
        #region Constructor

        public PolizaController()
        {
        }

        #endregion

        #region Metodos Publicos

        public ActionResult Index()
        {
            var list = new List<PolizaModel>();
            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string fechaIni, string fechaFin, string dniProspecto, string nombreProspecto)
        {

            return View();
        }

        public ActionResult CrearPoliza()
        {
           
            return View("Edit");
        }
        
        #endregion
    }
}