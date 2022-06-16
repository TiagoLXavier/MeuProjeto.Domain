using Flunt.Notifications;
using Flunt.Validations;
using MeuProjeto.Domain.Commands.Contracts;
using MeuProjeto.Domain.Handlers.Enum;
using System;

namespace MeuProjeto.Domain.Commands
{
    public class Command : Notifiable, ICommand
    {
        public Command() { }

        public Command(decimal valorCredito, TiposCreditos tipoCredito, int qtdParcelas, DateTime dataPrimeiroVencimento)
        {
            ValorCredito = valorCredito;
            TipoCredito = tipoCredito;
            QtdParcelas = qtdParcelas;
            DataPrimeiroVencimento = dataPrimeiroVencimento;
        }

        public decimal ValorCredito { get; set; }
        public TiposCreditos TipoCredito { get; set; }
        public int QtdParcelas { get; set; }
        public DateTime DataPrimeiroVencimento { get; set; }
        public decimal ValorTotal { get; private set ; }
        public decimal ValorJuros { get; private set; }

        public void Validate()
        {
            AddNotifications(
                new Contract()
                    .Requires()
                    .IsFalse((ValorCredito <= 0), "Credito", "O valor para empréstimo deve ser maior que Zero.")
                    .IsFalse((ValorCredito > 1000000), "Credito", "O valor máximo a ser liberado para empréstimo é de R$ 1.000.000,00.")
                    .IsFalse((TipoCredito == TiposCreditos.CreditoPessoaJuridica && ValorCredito < 15000), "Credito", "O valor mínimo liberado para empréstimo é de R$ 15.000,00.")
                    .IsFalse((QtdParcelas < 5), "Parcelas", "A quantidade mínima de parcelas é de 5x.")
                    .IsFalse((QtdParcelas > 72), "Parcelas", "A quantidade máxima de parcelas é de 72x.")
                    .IsBetween(DataPrimeiroVencimento, DateTime.Now.AddDays(15), DateTime.Now.AddDays(40), "Primeiro Vencimento", "A data do primeiro vencimento sempre será no mínimo 15 dias e no máximo 40 dias apartir da data atual")
            );
        }

        public void CalcularCredito()
        {
            switch (TipoCredito)
            {
                case TiposCreditos.CreditoConsignado:
                    ValorJuros = (ValorCredito * 0.01m);
                    break;
                case TiposCreditos.CreditoDireto:
                    ValorJuros = (ValorCredito * 0.02m);
                    break;
                case TiposCreditos.CreditoPessoaJuridica:
                    ValorJuros = (ValorCredito * 0.05m);
                    break;
                case TiposCreditos.CréditoImobiliario:
                    ValorJuros = (ValorCredito * 0.09m);
                    break;
                case TiposCreditos.CréditoPessoaFisica:
                    ValorJuros = (ValorCredito * 0.03m);
                    break;
                default:
                    ValorJuros = 0;
                    break;
            }

            ValorTotal = (ValorCredito + ValorJuros);
        }
    }
}
