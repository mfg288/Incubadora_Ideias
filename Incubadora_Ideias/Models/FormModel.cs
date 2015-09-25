using System.Collections.Generic;

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

    public class Ideia
    {
        public string Titulo { get; set; }
        public int Pontuacao { get; set; }
        public string Descricao { get; set; }
        public string Tipo { get; set; }
        public int SomaVisualizacoes { get; set; }
        public int MaxVisualizacoes { get; set; }
        public int MinVisualizacoes { get; set; }
        public decimal MedVisualizacoes { get; set; }
        public List<string> Imagens { get; set; }
        public List<string> Tags { get; set; }
    }

    public class EditarErros
    {
        public int ID { get; set; }
        public string Descricao { get; set; }
        public string Titulo { get; set; }
        public string User { get; set; }
        public string UserName { get; set; }
    }

    public class RecuperarErros
    {
        public string ErroDescricao { get; set; }
    }

    //public class Ideiaid
    //{
    //    public string Titulo { get; set; }
    //    public int Pontuacao { get; set; }
    //    public string Descricao { get; set; }
    //    public string Tipo { get; set; }
    //    public int SomaVisualizacoes { get; set; }
    //    public int MaxVisualizacoes { get; set; }
    //    public int MinVisualizacoes { get; set; }
    //    public decimal MedVisualizacoes { get; set; }
    //    public List<string> Imagens { get; set; }
    //    public List<string> Tags { get; set; }
    //}

}