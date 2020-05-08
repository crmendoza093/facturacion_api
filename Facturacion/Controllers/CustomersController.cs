using System;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;
using Facturacion.Models;

namespace Facturacion.Controllers
{
    public class CustomersController : ApiController
    {
        private facturacionEntities db = new facturacionEntities();
        
        [HttpGet]
        [Route("api/Customers/GetCustomer")]
        public object GetCustomer()
        {
            DateTime StartDate = DateTime.Parse("01 Feb 2000");
            DateTime EndDate = DateTime.Parse("25 May 2000");

            var CustomerByOrderDate = from c in db.Customer
                                      join o in db.Order on c.id equals o.id_customer
                                      where c.id == o.id_customer && c.age <= 35
                                      select new { c.name, c.age, o.date_order };

            return CustomerByOrderDate.Where(x => x.date_order >= StartDate && x.date_order <= EndDate);
        }

        [HttpGet]
        [Route("api/Customers/GetTtotalCustomers")]
        public object GetAllCustomer()
        {
            return db.Customer;
        }

        }
}