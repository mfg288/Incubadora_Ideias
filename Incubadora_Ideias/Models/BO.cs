using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Incubadora_Ideias.Models
{

    public class User
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public int Pais { get; set; }
        public int PerguntaSecreta { get; set; }
        public string RespostaSecreta { get; set; }
        public string Telefone { get; set; }
        public bool Pessoal { get; set; }
        public string Foto { get; set; }
    }


    public class EditarErros
    {
        public int ID { get; set; }

        public string Descricao { get; set; }

        public string Titulo { get; set; }
        public string User { get; set; }
        public string UserName { get; set; }
    }
    public class Ideia
    {
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public List<string> Tags { get; set; }
    }
}