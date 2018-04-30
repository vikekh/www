using Microsoft.AspNetCore.Mvc;

namespace Vikekh.Www.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Error()
        {
            return View();
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
