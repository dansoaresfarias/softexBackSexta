package LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Principal;

import java.util.Date;

import LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades.Agencia;
import LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades.Cliente;
import LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades.Conta;
import LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades.ContaCorrente;
import LogicaProgOO.Modulo04.BancoFinanceiroSoftex.Entidades.ContaPoupanca;

public class Principal {
    public static void main(String[] args) {
        Cliente abel = new Cliente("123.456.789-09", "Abel Felix", new Date(1985, 9, 7), "abelf@gmail.com");
        Cliente paula = new Cliente("123.456.555-66", "Paula Beatriz", new Date(1996, 10, 17), "paula.b@gmail.com");
        Agencia softex = new Agencia(123, "(81)21263633", "agsoftex@banco.com");
        ContaCorrente contaAbel = new ContaCorrente(1234, softex, abel, 3000, 500, (float) 0.002);
        ContaPoupanca contaPaula = new ContaPoupanca(1235, softex, paula, 15000, 500, (float) 0.001);
        contaAbel.depositar(5000);
        contaAbel.sacar(700);
        contaPaula.sacar(3000);
        contaPaula.depositar(1000);
        contaAbel.transferir(contaPaula, 300);
        // System.out.println(contaPaula.sacar(20000));
        //abel.setNome("Abel Felix");
        //abel.setEmail("abelf@gmail.com");
        // System.out.println(abel);
        System.out.println(contaAbel.extrato());
        System.out.println("\n\n" + contaPaula.extrato());
    }
}
