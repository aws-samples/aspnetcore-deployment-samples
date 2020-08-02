using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace ASPNETCoreDemo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "This is my ASP.NET application. There are many like it, but this one is mine.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "We want to hear from you!";

            return View();
        }
    }
}