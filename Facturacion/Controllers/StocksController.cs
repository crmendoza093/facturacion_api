using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Facturacion.Models;

namespace Facturacion.Controllers
{
    public class StocksController : ApiController
    {
        private facturacionEntities db = new facturacionEntities();
        
        [HttpGet]
        [Route("api/Stocks/GetStock")]
        public object GetStock()
        {
            var ProductsInStock = from p in db.Products
                                  join s in db.Stock on p.id equals s.id_product
                                  where p.id == s.id_product
                                  select new { p.product_name, p.price, s.stock1 };

            return ProductsInStock.Where(x=>x.stock1 == 5);
        }

        [HttpGet]
        [Route("api/Stocks/GetAllStocks")]
        public object GetAllStock()
        {
            return db.Stock;
        }
    }
}