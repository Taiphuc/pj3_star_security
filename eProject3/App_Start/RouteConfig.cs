using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace eProject3
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.IgnoreRoute("{*botdetect}", new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "eProject3.Controllers" }
            );

            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "EditProfile",
                url: "ho-so-nguoi-dung",
                defaults: new { controller = "User", action = "EditProfile", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "About Shop",
                url: "gioi-thieu",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Business Detail",
                url: "Businesses/Detail/{id}",
                defaults: new { controller = "Businesses", action = "Detail", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Product Category Detail",
                url: "Product/CategoryDetail/{metatitle}/{id}",
                defaults: new { controller = "Product", action = "CategoryDetail", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "New Category Detail",
                url: "New/NewsCategoryDetail/{metatitle}/{id}",
                defaults: new { controller = "New", action = "NewsCategoryDetail", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "New Detail",
                url: "New/NewsDetail/{metatitle}/{id}",
                defaults: new { controller = "New", action = "NewsDetail", id = UrlParameter.Optional }
            );
        }
    }
}
