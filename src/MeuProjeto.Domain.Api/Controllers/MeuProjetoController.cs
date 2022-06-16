using MeuProjeto.Domain.Commands;
using MeuProjeto.Domain.Handlers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace MeuProjeto.Domain.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MeuProjetoController : ControllerBase
    {
        private readonly ILogger<MeuProjetoController> _logger;

        public MeuProjetoController(ILogger<MeuProjetoController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public GenericCommandResult Create(
            [FromBody] Command command,
            [FromServices] Handler handler
        )
        {
            return (GenericCommandResult)handler.Handle(command);
        }
    }
}
