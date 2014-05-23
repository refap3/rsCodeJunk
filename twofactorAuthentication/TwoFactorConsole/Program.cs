using System;
using System.Text;
using TwoFactor;

namespace TwoFactorConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var preSecret = "1234567890";

            //for (int i = 0; i < 10; i++)
            //{
            //    Console.WriteLine(HashedOneTimePassword.GeneratePassword(preSecret, i));
            //}

            //long[] seconds = new long[] { 59, 1111111109, 1111111111, 1234567890, 2000000000, 20000000000 };

            //foreach (var second in seconds)
            //{
            //    Console.WriteLine(TimeBasedOneTimePassword.GetPassword(preSecret, TimeBasedOneTimePassword.UNIX_EPOCH + TimeSpan.FromSeconds(second), TimeBasedOneTimePassword.UNIX_EPOCH, 30, 8));
            //}

   

            var enc = new Base32Encoder();

            while (true)
            {

                // feed this into GA to create a new Application 
                string secret = enc.Encode(Encoding.ASCII.GetBytes(preSecret));

                Console.WriteLine(secret);

                //this will get the preSecret key back ... 
                var preSecretBack = Encoding.UTF8.GetString ( enc.Decode(secret));
                Console.WriteLine(preSecretBack); 

                // this would be a VALID password right now 
                Console.WriteLine("Valid pw: " + TimeBasedOneTimePassword.GetPassword(preSecret));

                Console.WriteLine("Enter your password: ");
                string password = Console.ReadLine();
                if (password=="")
                {
                    break; 
                }

                // this will check the entered password (possibly from GA) ...

                if (TimeBasedOneTimePassword.IsValid(preSecret, password))
                {
                    Console.WriteLine("Success!");
                }
                else
                {
                    Console.WriteLine("ERROR!");
                } 
            }

            return;

        }
        
    }
}
