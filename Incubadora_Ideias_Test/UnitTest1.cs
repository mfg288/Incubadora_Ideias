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
            const string password = "password";
            const string passPhrase = "abcdef";

            var encryptedString = Helper.Encrypt(password, passPhrase);
        }        
        
        [Test]
        public void DecryptPassword()
        {
            const string passPhrase = "abcdef";
			const string encryptStr = "rXKSYjwo39N5JYwB+GH0vzNIknlpYDRZ5Q0desum3B8=";

            var decryptedstring = Helper.Decrypt(encryptStr, passPhrase);
        }
    }
}
