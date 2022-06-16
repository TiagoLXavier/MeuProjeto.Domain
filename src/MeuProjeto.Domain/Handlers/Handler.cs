using Flunt.Notifications;
using MeuProjeto.Domain.Commands;
using MeuProjeto.Domain.Commands.Contracts;
using MeuProjeto.Domain.Handlers.Contracts;
using System.Globalization;

namespace MeuProjeto.Domain.Handlers
{
    public class Handler : Notifiable, IHandler<Command>
    {
        public ICommandResult Handle(Command command)
        {
            command.Validate();
            if (command.Invalid)
                return new GenericCommandResult("Recusado", command.Notifications);

            command.CalcularCredito();

            return new GenericCommandResult("Aprovado", new { ValorTotal = command.ValorTotal.ToString("C", CultureInfo.CurrentCulture), ValorJuros = command.ValorJuros.ToString("C", CultureInfo.CurrentCulture) });
        }
    }
}
