using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WAfromDB.Startup))]
namespace WAfromDB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
