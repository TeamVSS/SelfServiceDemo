using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SelfServiceDemo.Utilities;

namespace SelfServiceDemo.Models
{



    public class ProfilePull
    {
        public Orderhistory[] orderhistory { get; set; }
        public object[] contractdetails { get; set; }
        public string lineofbusiness { get; set; }
        public Existingsnp existingsnp { get; set; }
        public Customerdetails customerdetails { get; set; }

        public Profile GetCustomProfile()
        {
            Profile profile = new Profile();
            Connectionaddress address = this.customerdetails.connectionaddress;
            profile.FirstName = this.customerdetails.fname;
            profile.LastName = this.customerdetails.lname;
            profile.ServiceAddress = String.Format("{0},{1}-{2} , {3}, {4}", address.streetname, address.city, address.zipcode, address.state, address.country);
            profile.Orders = new List<OrderWrapper>();
            if (orderhistory != null)
            {
                foreach (var order in orderhistory)
                {
                    OrderWrapper orderWrap = new OrderWrapper();
                    orderWrap.Id = order.orderid.ToString();
                    orderWrap.InstallationDate = order.duedate.ToDateTime();
                    orderWrap.OrderDate = order.dateoforder.ToDateTime();
                    orderWrap.Services = new List<ServiceWrapper>();
                    if (order.services != null)
                    {
                        foreach (var service in order.services)
                        {
                            orderWrap.Services.Add(new ServiceWrapper() { Name = service.servicename });
                        }
                    }

                    orderWrap.Status = order.orderstatus;
                    profile.Orders.Add(orderWrap);
                }
            }


            return profile;
        }
    }

    public class Existingsnp
    {
        public string services { get; set; }
        public string products { get; set; }
    }

    public class Customerdetails
    {
        public Billingaddress billingaddress { get; set; }
        public string fname { get; set; }
        public string dateofbirth { get; set; }
        public string lname { get; set; }
        public int contactnumber { get; set; }
        public int customerid { get; set; }
        public Connectionaddress connectionaddress { get; set; }
        public string customerstatus { get; set; }
        public string email { get; set; }
    }

    public class Billingaddress
    {
        public int zipcode { get; set; }
        public string country { get; set; }
        public string streetname { get; set; }
        public string city { get; set; }
        public int stateid { get; set; }
        public string state { get; set; }
    }

    public class Connectionaddress
    {
        public int zipcode { get; set; }
        public string country { get; set; }
        public string streetname { get; set; }
        public string city { get; set; }
        public int stateid { get; set; }
        public string state { get; set; }
    }

    public class Orderhistory
    {
        public string orderstatus { get; set; }
        public int orderid { get; set; }
        public string duedate { get; set; }
        public Service[] services { get; set; }
        public string dateoforder { get; set; }
        public Product[] products { get; set; }
    }

    public class Service
    {
        public Quantity quantity { get; set; }
        public string servicecode { get; set; }
        public string servicename { get; set; }
    }

    public class Quantity
    {
        public int current { get; set; }
        public int max { get; set; }
    }

    public class Product
    {
        public string productcode { get; set; }
        public string productname { get; set; }
    }



}