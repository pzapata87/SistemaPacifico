using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SistemaPacifico.Startup))]
namespace SistemaPacifico
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
