using Razorpay.Api;
using System;
using System.Collections.Generic;
//using static Soil.OrderHistory;

namespace Soil
{
    class Program
    {
        static void Main(string[] args)
        {
            // Replace with your Razorpay API Key and Secret
            string keyId = "rzp_test_fuI1vN9PeqNYqM";
            string keySecret = "mpPYs59Cu4HojkLqoGiX8Kp3";

            // Initialize RazorpayClient
            RazorpayClient client = new RazorpayClient(keyId, keySecret);

            Console.WriteLine("Connected to Razorpay!");

            // Example: Create an Order
            var options = new Dictionary<string, object>
            {
                { "amount", 50000 }, // Amount in smallest currency unit (e.g., 50000 = 500.00 INR)
                { "currency", "INR" },
                { "receipt", "order_rcptid_11" },
                { "payment_capture", 1 } // Auto capture payment
            };

            try
            {
                Order order = client.Order.Create(options);
                Console.WriteLine("Order created successfully!");
                Console.WriteLine("Order ID: " + order["id"]);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error creating order: " + ex.Message);
            }
        }
    }
}
