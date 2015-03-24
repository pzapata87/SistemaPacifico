using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Pacifico.Bussines;
using SistemaPacifico.Core;
using SistemaPacifico.Models;

namespace SistemaPacifico.Controllers
{
    public class PolizaController : Controller
    {
        #region Variables

        private readonly PolizaBusiness _polizaBL;

        #endregion

        #region Constructor

        public PolizaController()
        {
            _polizaBL = new PolizaBusiness();
        }

        #endregion

        #region Metodos Públicos

        public ActionResult Index()
        {
            var list = new List<PolizaModel>();
            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string numSolicitud, string fechaIngreso, string monto)
        {
            var list = new List<PolizaModel>();
            return View(list);
        }

        public ActionResult CrearPoliza()
        {
            var model = new PolizaModel
            {
                Accion = "CrearPoliza",
                TipoPlanList = GetTipoPlanList()
            };

            model.TipoPlanList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }
        
        #endregion

        #region Metodos Privados

        private List<Comun> GetTipoPlanList()
        {
            return _polizaBL.TipoPlanAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Plan,
                Valor = Convert.ToString(p.Cod_Plan)
            });
        }

        #endregion
    }
}