
Program Pzim ;

Type 
  opcionais = Record
    nome : array[1..4] Of string;
    valor: array[1..4] Of real;
  End;
  carrosUsados = Record
    marca : string;
    modelo: string;
    valorCompra: real;
    valorVenda: real;
    opcionais: opcionais;
  End;

Const 
  MAX = 3;

Var 
  valorTotalCompra, valorTotalVenda, valorTotalCarro, lucro: real;
  i, j: integer;
  carro: array[1..4] Of carrosUsados;

Begin

  valorTotalVenda := 0.0;
  valorTotalCompra := 0.0;

  For i :=1 To MAX Do
    Begin

      writeln('Marca do carro ', i ,': ');
      readln(carro[i].marca);
      writeln('Modelo do carro ', i ,': ');
      readln(carro[i].modelo);
      writeln('Valor da compra do ', carro[i].modelo ,': ');
      readln(carro[i].valorCompra);
      writeln('Valor da venda do ', carro[i].modelo ,': ');
      readln(carro[i].valorVenda);

      For j:= 1 To 4 Do
        Begin
          writeln('Informe o nome do opcional ', j, ' do carro ', carro[i].modelo
                  , '; ');
          readln(carro[i].opcionais.nome[j]);
          writeln('Informe o valor do ', carro[i].opcionais.nome[j], ' do carro ', carro[i].
                  modelo, '; ');
          readln(carro[i].opcionais.valor[j]);
        End;
      clrscr;
    End;

  clrscr;
  For i:= 1 To MAX Do
    Begin

    	valorTotalCompra  := valorTotalCompra + carro[i].valorCompra;
      valorTotalCarro := carro[i].valorVenda;
      writeln(carro[i].modelo, ': ', carro[i].valorVenda :0:2);

      For j := 1 To 4 Do
        Begin
          valorTotalCarro := valorTotalCarro + carro[i].opcionais.valor[j];
          
          if(carro[i].opcionais.valor[j] > 0) then
          	writeln(carro[i].opcionais.nome[j], ': ', carro[i].opcionais.valor[j] :0:2)
          else
            writeln(carro[i].opcionais.nome[j], ': ', 'NAO DISPONIVEL');
          	
        End;

      writeln('Valor total do carro ', carro[i].modelo, ': ', valorTotalCarro :0:2);
      valorTotalVenda := valorTotalVenda + valorTotalCarro;
      writeln('---------------------------------------------------------------------');
      writeln();
    End;

  lucro := valorTotalVenda - valorTotalCompra;
  writeln('Valor total gasto com a compra dos carros: ', valorTotalCompra :0:2);
  writeln('Valor total de vendas: ', valorTotalVenda :0:2);
  writeln('O valor do lucro obtido pela empresa é de: ', lucro :0:2)
End.
