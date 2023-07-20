using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OracleFix;

namespace FixOracle.Net
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendFile(object sender, EventArgs e)
        {
            ReturnFile("GisSecurityPkg.Designer.cs", "text/plain", "bonzo.cs", this.Response);
        }

        public static void ReturnFile(string Filename, string ContentType, string SaveAsFileName, HttpResponse response)
        {
            response.Clear();
            response.AddHeader("content-disposition", "attachment;filename=" + SaveAsFileName);
            response.ContentType = ContentType;
            response.WriteFile(Filename);
            response.End();
        }

        //Sends the FileText as a file.
        public static void ReturnFileAsText(string FileText, string ContentType, string SaveAsFileName, HttpResponse response)
        {
            response.Clear();
            response.AddHeader("content-disposition", "attachment;filename=" + SaveAsFileName);
            response.ContentType = ContentType;
            response.Write(FileText);
            response.End();
        }

        protected void UploadFile(object sender, EventArgs e)
        {
            if (Path.GetExtension(FileUpload1.PostedFile.FileName) != ".cs")
            {
                errorLabel.Text = "Sorry, only .CS (CSharp) files can be procsses.";
                errorLabel.ForeColor = Color.Red;
                return;
            }
            if (FileUpload1.PostedFile.ContentLength > 1024*1024*1)
            {
                errorLabel.Text = "Sorry, only source files up to 1mb can be processed.";
                errorLabel.ForeColor = Color.Red;
                return;
            }
            
            string tmpFileName = Path.Combine(Server.MapPath("./Uploads"), Path.GetRandomFileName());
            try {
                FileUpload1.PostedFile.SaveAs(tmpFileName);
                var oracleFile = new OracleFile(tmpFileName);
                if (!oracleFile.ContainsTableAdapters()) {
                    errorLabel.Text = "This file doesn't seem to contain any table adapters.";
                    errorLabel.ForeColor = Color.Red;
                    return;
                }

                var options = new Options
                              {
                                  FixCasts = true,
                                  FixNullTests = true,
                                  MakeCommandsPublic = true
                              };
                oracleFile.Fix(options);

                ReturnFile(tmpFileName, "plain/text", FileUpload1.PostedFile.FileName, Response);
            }
            finally {
                //Add the file for deletion when the session ends.
                if (Session["UserFiles"] == null) {
                    Session["UserFiles"] = new List<string>();
                }
                var userFiles = Session["UserFiles"] as List<string>;
                userFiles.Add(tmpFileName);

            }
        }



    }
}
