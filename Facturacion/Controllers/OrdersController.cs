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
    public class OrdersController : ApiController
    {
        private facturacionEntities db = new facturacionEntities();

        [HttpGet]
        [Route("api/Orders/GetTotalQuantity")]
        public object GetTotalQuantity()
        {
            var TotalSalesByProduct = from o in db.Order
                                      join p in db.Products on o.id_product equals p.id
                                      where o.id_product == p.id && o.date_order.Value.Year == 2000
                                      select new { p.id, p.product_name, o.date_order, o.quantity };

            return TotalSalesByProduct.GroupBy(x=>x.id).Select(y => new { IdProduct = y.Key, Quantity = y.Sum(x=> x.quantity) } );
        }


        [HttpGet]
        [Route("api/Orders/GetOrders")]
        public object GetOrder()
        {
            return db.Order;
        }
        
    }
}