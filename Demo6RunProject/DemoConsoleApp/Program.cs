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
            string queryString = @"SELECT [AddressID], [AddressLine1], City FROM [SalesLT].[Address]";
            string insertCommandString = @"INSERT INTO SalesLT.Address([AddressLine1], [City], [StateProvince], [CountryRegion], [PostalCode]) VALUES(@addressLine1, @city, @stateProvince, @countryRegion, @postalCode)";
            string connectionString = @"Server=(LocalDb)\ProjectsV13;Initial Catalog=AdventureWorksLT2019;Integrated Security=SSPI;Trusted_Connection=yes;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                Console.WriteLine("Inserting an address.");
                SqlCommand command = new SqlCommand(insertCommandString, connection);
                command.Parameters.AddWithValue("@addressLine1", "Main Street No 114");
                command.Parameters.AddWithValue("@city", "Bigcity");
                command.Parameters.AddWithValue("@stateProvince", "First Province");
                command.Parameters.AddWithValue("@countryRegion", "East Region");
                command.Parameters.AddWithValue("@postalCode", "123456");
                Console.WriteLine($"Insert done. {command.ExecuteNonQuery()} lines affected.");

                Console.WriteLine("Read the address.");
                command = new SqlCommand(queryString, connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    Console.WriteLine("[AddressID], [AddressLine1], [City]");
                    while (reader.Read())
                    {
                        Console.WriteLine(String.Format("{0}, {1}, {2}", reader[0], reader[1], reader[2]));
                    }
                }
            }

            Console.ReadLine();
        }
    }
}
