using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace muhAtolyesiProject
{
    public class AntiSqlInjection
    {

        public string tehlikeliIfadeleriTemizle(string input)
        {
            string data = input.Trim();
            data = data.Replace("&gt;", "");
            data = data.Replace("&lt;", "");
            data = data.Replace(">", "");
            data = data.Replace("<", "");
            data = data.Replace("--", "");
            data = data.Replace("'", "");
            data = data.Replace(";", "");
            data = data.Replace("=", "");
            data = data.Replace("char ", "");
            data = data.Replace("delete ", "");
            data = data.Replace("insert ", "");
            data = data.Replace("update ", "");
            data = data.Replace("select ", "");
            data = data.Replace("truncate ", "");
            data = data.Replace("union", "");
            data = data.Replace("script ","");
            data = data.Replace("or ", "");
            return data;
        }

    }
}