using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace muhAtolyesiProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["online"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["online"] = Convert.ToInt32(Application["online"]) + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if (Request.FilePath == "dpuceng.com")
            {
                Response.RedirectPermanent("http://www.myblog56.com", true);
            }
            if (Request.FilePath == "dpuceng.com/Default.aspx")
            {
                Response.RedirectPermanent("http://www.myblog56.com", true);
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["online"] = Convert.ToInt32(Application["online"]) - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            Application.Remove("online");
        }
    }
}