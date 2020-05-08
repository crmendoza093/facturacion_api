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
    public class ProductsController : ApiController
    {
        private facturacionEntities db = new facturacionEntities();
        
        public IQueryable<Products> GetProducts()
        {
            return db.Products;
        }
        
    }
}