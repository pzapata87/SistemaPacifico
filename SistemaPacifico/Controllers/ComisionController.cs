using System;
using System.Linq;
using System.Web.Mvc;
using Pacifico.Bussines;
using Pacifico.DataAccess;
using SistemaPacifico.Core;
using SistemaPacifico.Models;

namespace SistemaPacifico.Controllers
{
    public class ComisionController : Controller
    {
        #region Variables

        private readonly ComisionBusiness _comisionBL;

        #endregion

        #region Constructor

        public ComisionController()
        {
            _comisionBL = new ComisionBusiness();
        }

        #endregion

        #region Metodos Publicos

        public ActionResult Index()
        {
            var list = _comisionBL.FindAll().ToList().ConvertAll(p => new ComisionModel
            {
                CodigoComision = p.Co_Comision,
                NombreComision = p.No_Comision,
                FechaRegistro = p.Fe_Registro.GetDate(),
                CargoComisionista = p.Empleado != null ? p.Empleado.Cargo.No_Cargo : string.Empty,
                CampaniaNombre = p.Campania.No_Campania,
                CanalVentaNombre = p.CanalVenta.No_CanalVenta
            });

            return View(list);
        }

        public ActionResult CrearComision()
        {
            var model = new ComisionModel();
            return View("Edit", model);
        }

        [HttpPost]
        public ActionResult CrearComision(ComisionModel model)
        {
            try
            {
                var comision = new Comision
                {
                    No_Comision = model.NombreComision,
                    //Campania = model
                };

                _comisionBL.Add(comision);
            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Comision"));
        }

        #endregion
    }
}