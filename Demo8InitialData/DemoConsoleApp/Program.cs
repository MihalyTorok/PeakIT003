using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string queryString = @"SELECT [Name], [ModifiedDate] FROM [SalesLT].[ProductModel]";
            string connectionString = @"Server=localhost;Initial Catalog=AdventureWorksLT2019;Integrated Security=SSPI;Trusted_Connection=yes;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                Console.WriteLine("Read the product models.");
                SqlCommand command = new SqlCommand(queryString, connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Console.WriteLine("[Name], [ModifiedDate]");
                    while (reader.Read())
                    {
                        Console.WriteLine(String.Format("{0}, {1}", reader[0], reader[1]));
                    }
                }
            }

            Console.ReadLine();
        }
    }
}
