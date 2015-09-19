using Incubadora_Ideias.Helpers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;

namespace Incubadora_Ideias_Test
{
    [TestClass]
    public class UnitTest1
    {
        [Test]
        public void EncryptPassword()
        {
            const string password = "12345";
            const string passPhrase = "abcdef";

            var encryptedString = Helper.Encrypt(password, passPhrase);
        }        
        
        [Test]
        public void DecryptPassword()
        {
            const string passPhrase = "abcdef";
            const string encryptStr = "9axgjXkpkC4J+a/nekUvww==";

            var decryptedstring = Helper.Decrypt(encryptStr, passPhrase);
        }
    }
}
