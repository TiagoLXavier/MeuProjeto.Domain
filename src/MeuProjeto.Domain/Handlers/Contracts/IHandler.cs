
using MeuProjeto.Domain.Commands.Contracts;

namespace MeuProjeto.Domain.Handlers.Contracts
{
    public interface IHandler<T> where T : ICommand
    {
        ICommandResult Handle(T command);
    }
}
