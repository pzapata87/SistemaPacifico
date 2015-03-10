using System;
using System.Web.Mvc;
using Stimulsoft.Report.Mvc;

namespace SistemaPacifico.Core
{
    public class ReportBaseController : Controller
    {

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