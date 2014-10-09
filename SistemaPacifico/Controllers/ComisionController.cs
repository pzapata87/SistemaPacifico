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
        private readonly CargoBusiness _cargoBL;
        private readonly CanalVentaBusiness _canalVentaBL;
        private readonly CampaniaBusiness _campaniaBL;
        private readonly RequisitoBusiness _requisitoBL;

        #endregion

        #region Constructor

        public ComisionController()
        {
            _comisionBL = new ComisionBusiness();
            _cargoBL = new CargoBusiness();
            _canalVentaBL = new CanalVentaBusiness();
            _campaniaBL = new CampaniaBusiness();
            _requisitoBL = new RequisitoBusiness();
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
                CargoNombre = p.Cargo.No_Cargo,
                CampaniaNombre = p.Campania.No_Campania,
                CanalVentaNombre = p.CanalVenta.No_CanalVenta
            });

            return View(list);
        }

        public ActionResult CrearComision()
        {
            var model = new ComisionModel
            {
                CargoList = _cargoBL.FindAll().ToList().ConvertAll(p => new Comun
                {
                   Nombre = p.No_Cargo,
                   Valor = p.Co_Cargo
                }),
                CampaniaList = _campaniaBL.FindAll().ToList().ConvertAll(p => new Comun
                {
                    Nombre = p.No_Campania,
                    Valor = p.Co_Campania
                }),
                CanalVentList = _canalVentaBL.FindAll().ToList().ConvertAll(p => new Comun
                {
                    Nombre = p.No_CanalVenta,
                    Valor = p.Co_CanalVenta
                }),
                RequisitoList = _requisitoBL.FindAll().ToList().ConvertAll(p => new Comun
                {
                    Nombre = p.No_Requisito,
                    Valor = p.Co_Requisito
                })
            };

            model.CargoList.Insert(0, new Comun{Nombre = "Seleccionar", Valor = 0});
            model.CampaniaList.Insert(0, new Comun { Nombre = "Seleccionar", Valor = 0 });
            model.CanalVentList.Insert(0, new Comun { Nombre = "Seleccionar", Valor = 0 });

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
                    Co_Campania = model.CampaniaId,
                    Co_CanalVenta = model.CanalVentaId,
                    Co_Cargo = model.CargoId,
                    Fe_Registro = DateTime.Now
                };

                if (model.RequisitoListSelected != null)
                {
                    foreach (var item in model.RequisitoListSelected)
                    {
                        comision.ComisionRequisito.Add(new ComisionRequisito
                        {
                            Co_Requisito = item
                        });
                    }
                }

                if (model.RangoList != null)
                {
                    foreach (var item in model.RangoList)
                    {
                        comision.Rango.Add(new Rango
                        {
                            Ss_Maximo = item.Maximo,
                            Ss_Minimo = item.Minimo,
                            Qt_Cantidad = item.Cantidad
                        });
                    }
                }

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