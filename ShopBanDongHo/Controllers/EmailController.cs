using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ShopBanDongHo.Models;
using System.Net.Mail;
namespace ShopBanDongHo.Controllers
{
    public class EmailController : ApiController
    {
        public IHttpActionResult sendmail(EmailClass ec)
        {
            string subject = ec.subject;
            string body = ec.body;
            string to = ec.to;
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("znpronz@gmail.com");
            mailMessage.To.Add(to);
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.UseDefaultCredentials = true;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new System.Net.NetworkCredential("znpronz@gmail.com", "vanlang123");
            smtp.Send(mailMessage);
            return Ok();
        }
    }
}
