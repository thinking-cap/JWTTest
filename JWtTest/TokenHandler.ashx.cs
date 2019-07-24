using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JWtTest
{
    /// <summary>
    /// Summary description for TokenHandler
    /// </summary>
    public class TokenHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "";
            string token = context.Request["token"];
            //
           

                if (!string.IsNullOrEmpty(token))
                {
                    string op = context.Request["op"];
                    if (string.IsNullOrEmpty(op))
                        op = "validate";
                   
                    switch (op)
                    {
                        case "validate":
                        bool tokenValid = JWTHelper.DecodeAndValidateResponseJwt(token);
                        result = "{\"result\":\"valid\"}";
                        break;                       
                    }
                }
                else
                    result = "{\"result\":\"invalid_parameters_did\"}";
            
            //
            context.Response.ContentType = "text/json";
            context.Response.Write(result);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}