using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Stimulsoft.Report.Mvc;

namespace SistemaPacifico.Core
{
    public class ReportBaseController : Controller
    {
        #region Propiedades

        public Dictionary<string, string> ParametrosReport
        {
            get
            {
                return TempData["Parametros"] != null
                    ? (Dictionary<string, string>)TempData["Parametros"]
                    : null;
            }
        }

        #endregion

        public virtual ActionResult GerReportSnapshot()
        {
            throw new NotImplementedException();
        }

        public ActionResult ViewerEvent()
        {
            return StiMvcViewer.ViewerEventResult(HttpContext);
        }

        public ActionResult PrintReport()
        {
            return StiMvcViewer.PrintReportResult(HttpContext);
        }

        public ActionResult ExportReport()
        {
            return StiMvcViewer.ExportReportResult();
        }

        public ActionResult Interaction()
        {
            return StiMvcViewer.InteractionResult(HttpContext);
        }
    }
}