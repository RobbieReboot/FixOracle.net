using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace FixOracle.Net
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            if (Session["UserFiles"] != null) {
                var userFiles = Session["UserFiles"] as List<string>;
                if (userFiles!=null)
                    foreach (var s in userFiles) {
                        try {
                            if (File.Exists(s)) {
                                File.Delete(s);
                            }
                        } catch {
                        }
                    }
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}