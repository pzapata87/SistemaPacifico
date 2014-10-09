using System;
using System.Collections.Generic;
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

        [HttpPost]
        public ActionResult Index(string nombreComision, string canalVenta, string campania)
        {

            var list =
                _comisionBL.FindAll(nombreComision, canalVenta, campania).ToList().ConvertAll(p => new ComisionModel
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
            var model = new ComisionModel();
            DatosIniciales(model);
            model.Accion = "CrearComision";
            model.RangoList = new List<RangoModel>();

            model.CargoList.Insert(0, new Comun{Nombre = "[SELECCIONAR]", Valor = string.Empty});
            model.CampaniaList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });
            model.CanalVentList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        public ActionResult EditarComision(int id)
        {
            var comision = _comisionBL.Get(id);
            var model = new ComisionModel
            {
                CodigoComision = comision.Co_Comision,
                NombreComision = comision.No_Comision,
                CargoId = comision.Co_Cargo,
                CanalVentaId = comision.Co_CanalVenta,
                CampaniaId = comision.Co_Campania,
                RequisitoListSelected = comision.ComisionRequisito.Select(p => p.Co_Requisito).ToList(),
                RangoList = comision.Rango.Select(p => new RangoModel
                {
                    Minimo = p.Ss_Minimo,
                    Maximo = p.Ss_Maximo,
                    Cantidad = p.Qt_Cantidad
                }).ToList(),
                Accion = "EditarComision"
            };

            DatosIniciales(model);

            model.CargoList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });
            model.CampaniaList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });
            model.CanalVentList.Insert(0, new Comun { Nombre = "[SELECCIONAR]", Valor = string.Empty });

            return View("Edit", model);
        }

        public ActionResult VerComision(int id)
        {
            var comision = _comisionBL.Get(id);

            var model = new ComisionModel
            {
                NombreComision = comision.No_Comision,
                CampaniaNombre = comision.Campania.No_Campania,
                CargoNombre = comision.Cargo.No_Cargo,
                CanalVentaNombre = comision.CanalVenta.No_CanalVenta,
                RequisitoList = comision.ComisionRequisito.Select(p => new Comun
                {
                    Valor = Convert.ToString(p.Requisito.Co_Requisito),
                    Nombre = p.Requisito.No_Requisito
                }).ToList(),
                RangoList = comision.Rango.Select(p => new RangoModel
                {
                    Minimo = p.Ss_Minimo,
                    Maximo = p.Ss_Maximo,
                    Cantidad = p.Qt_Cantidad
                }).ToList()
            };

            return View("Ver", model);
        }

        [HttpPost]
        public ActionResult EditarComision(ComisionModel model)
        {
            try
            {
                var comision = _comisionBL.Get(model.CodigoComision);
                comision.No_Comision = model.NombreComision;
                comision.Co_Campania = model.CampaniaId;
                comision.Co_CanalVenta = model.CanalVentaId;
                comision.Co_Cargo = model.CargoId;

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

                _comisionBL.Update(comision);
            }
            catch (Exception)
            {

            }

            return Json(Url.Action("Index", "Comision"));
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

        #region Metodos Privados

        private void DatosIniciales(ComisionModel model)
        {
            model.CargoList = _cargoBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.No_Cargo,
                Valor = Convert.ToString(p.Co_Cargo)
            });
            model.CampaniaList = _campaniaBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.No_Campania,
                Valor = Convert.ToString(p.Co_Campania)
            });
            model.CanalVentList = _canalVentaBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.No_CanalVenta,
                Valor = Convert.ToString(p.Co_CanalVenta)
            });
            model.RequisitoList = _requisitoBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.No_Requisito,
                Valor = Convert.ToString(p.Co_Requisito)
            });
        }

        #endregion
    }
}