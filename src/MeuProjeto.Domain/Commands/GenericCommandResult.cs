using MeuProjeto.Domain.Commands.Contracts;

namespace MeuProjeto.Domain.Commands
{
    public class GenericCommandResult : ICommandResult
    {
        public GenericCommandResult() { }

        public GenericCommandResult(string statusCredito, object data)
        {
            StatusCredito = statusCredito;
            Data = data;
        }

        public string StatusCredito { get; set; }
        public object Data { get; set; }
    }
}
