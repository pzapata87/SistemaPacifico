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
            var list = _comisionBL.FindAll().OrderByDescending(p => p.Cod_Com).ToList().ConvertAll(p => new ComisionModel
            {
                CodigoComision = p.Cod_Com,
                NombreComision = p.Nro_Com,
                FechaRegistro = p.Fec_Reg.GetDate(),
                CargoNombre = p.Cargo.Nro_Car,
                CampaniaNombre = p.Campania.Nro_Camp,
                CanalVentaNombre = p.CanalVenta.Nro_Cnl_Vta
            });

            return View(list);
        }

        [HttpPost]
        public ActionResult Index(string nombreComision, string canalVenta, string campania)
        {
            ViewBag.NombreComision = nombreComision;
            ViewBag.CanalVenta = canalVenta;
            ViewBag.Campania = campania;

            var list =
                _comisionBL.FindAll(nombreComision, canalVenta, campania).ToList().ConvertAll(p => new ComisionModel
                {
                    CodigoComision = p.Cod_Com,
                    NombreComision = p.Nro_Com,
                    FechaRegistro = p.Fec_Reg.GetDate(),
                    CargoNombre = p.Cargo.Nro_Car,
                    CampaniaNombre = p.Campania.Nro_Camp,
                    CanalVentaNombre = p.CanalVenta.Nro_Cnl_Vta
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
                CodigoComision = comision.Cod_Com,
                NombreComision = comision.Nro_Com,
                CargoId = comision.Cod_Car,
                CanalVentaId = comision.Cod_Cnl_Vta,
                CampaniaId = comision.Cod_Camp,
                RequisitoListSelected = comision.ComisionRequisito.Select(p => p.Cod_Req).ToList(),
                RangoList = comision.Rango.Select(p => new RangoModel
                {
                    Minimo = p.Ss_Min,
                    Maximo = p.Ss_Max,
                    Cantidad = p.Qtd_Cant
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
                NombreComision = comision.Nro_Com,
                CampaniaNombre = comision.Campania.Nro_Camp,
                CargoNombre = comision.Cargo.Nro_Car,
                CanalVentaNombre = comision.CanalVenta.Nro_Cnl_Vta,
                RequisitoList = comision.ComisionRequisito.Select(p => new Comun
                {
                    Valor = Convert.ToString(p.Cod_Req),
                    Nombre = p.Requisito.Nro_Req
                }).ToList(),
                RangoList = comision.Rango.Select(p => new RangoModel
                {
                    Minimo = p.Ss_Min,
                    Maximo = p.Ss_Max,
                    Cantidad = p.Qtd_Cant
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
                comision.Nro_Com = model.NombreComision;
                comision.Cod_Camp = model.CampaniaId;
                comision.Cod_Cnl_Vta = model.CanalVentaId;
                comision.Cod_Car = model.CargoId;

                if (model.RequisitoListSelected != null)
                {
                    foreach (var item in model.RequisitoListSelected)
                    {
                        comision.ComisionRequisito.Add(new ComisionRequisito
                        {
                            Cod_Req = item
                        });
                    }
                }

                if (model.RangoList != null)
                {
                    foreach (var item in model.RangoList)
                    {
                        comision.Rango.Add(new Rango
                        {
                            Ss_Max = item.Maximo,
                            Ss_Min = item.Minimo,
                            Qtd_Cant = item.Cantidad
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
                    Nro_Com = model.NombreComision,
                    Cod_Camp = model.CampaniaId,
                    Cod_Cnl_Vta = model.CanalVentaId,
                    Cod_Car = model.CargoId,
                    Fec_Reg = DateTime.Now
                };

                if (model.RequisitoListSelected != null)
                {
                    foreach (var item in model.RequisitoListSelected)
                    {
                        comision.ComisionRequisito.Add(new ComisionRequisito
                        {
                            Cod_Req = item
                        });
                    }
                }

                if (model.RangoList != null)
                {
                    foreach (var item in model.RangoList)
                    {
                        comision.Rango.Add(new Rango
                        {
                            Ss_Max = item.Maximo,
                            Ss_Min = item.Minimo,
                            Qtd_Cant = item.Cantidad
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
                Nombre = p.Nro_Car,
                Valor = Convert.ToString(p.Cod_Car)
            });
            model.CampaniaList = _campaniaBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Camp,
                Valor = Convert.ToString(p.Cod_Camp)
            });
            model.CanalVentList = _canalVentaBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Cnl_Vta,
                Valor = Convert.ToString(p.Cod_Cnl_Vta)
            });
            model.RequisitoList = _requisitoBL.FindAll().ToList().ConvertAll(p => new Comun
            {
                Nombre = p.Nro_Req,
                Valor = Convert.ToString(p.Cod_Req)
            });
        }

        #endregion
    }
}