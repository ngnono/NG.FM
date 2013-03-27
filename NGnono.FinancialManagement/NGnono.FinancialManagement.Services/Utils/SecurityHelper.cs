using NGnono.Framework.Logger;
using NGnono.Framework.ServiceLocation;
using System;
using System.Security.Cryptography;

namespace NGnono.FinancialManagement.Services.Utils
{
    public static class SecurityHelper
    {
        public static string ComputeHash(string pass)
        {
            //step1: create salt 
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            //step2: create pass hash
            var pbkdf2 = new Rfc2898DeriveBytes(pass, salt, 10000);
            //step3: combine hash and salt
            var hash = pbkdf2.GetBytes(20);
            var hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            //step4: base64 encode
            return Convert.ToBase64String(hashBytes);
        }

        public static bool CheckEqual(string pass, string hashedPass)
        {
            /* Extract the bytes */
            byte[] hashBytes;
            try
            {
                hashBytes = Convert.FromBase64String(hashedPass);
            }
            catch (Exception ex)
            {
                var logger = ServiceLocator.Current.Resolve<ILog>();
                logger.Error(ex);

                return false;
            }
            /* Get the salt */
            var salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);
            /* Compute the hash on the password the user entered */
            var pbkdf2 = new Rfc2898DeriveBytes(pass, salt, 10000);
            var hash = pbkdf2.GetBytes(20);
            /* Compare the results */
            for (var i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != hash[i])
                    return false;
            }

            return true;
        }
    }
}
