using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.IdentityModel.Tokens;
using Microsoft.IdentityModel.JsonWebTokens;


namespace JWtTest
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Buy.Attributes.Add("disabled", "true");
            string token = JWTHelper.GenerateToken(5);//generate token based on credentials
            JWTContainer.Value = token;          //pass token to js in hidden field 

            if(!Page.IsPostBack)
            {
                //initialize cardinal, pass the jwtoken created server side that contains the credentials...only once per page
               // ClientScript.RegisterStartupScript(this.GetType(), "", "<script language='javascript'>Cardinal.setup('init', { jwt: document.getElementById('JWTContainer').value });</script>");
            }
        }

        //protected void Buy_Click(object sender, EventArgs e)
        //{
        //    Buy.Enabled = false;
        //    Buy.Text = "Purchase done serverside!";
        //}
     }
}