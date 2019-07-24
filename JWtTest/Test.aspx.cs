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
            string token = JWTHelper.GenerateToken(5);//generate token based on credentials
            JWTContainer.Value = token;          //pass token to js in hidden field 
        }

        protected void Buy_Click(object sender, EventArgs e)
        {
            Buy.Enabled = false;
            Buy.Text = "Purchase done serverside!";
        }
     }
}