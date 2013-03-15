program exerc_L;

var cotacao, quant, result : real;

BEGIN
cotacao:=0.0; quant:=0.0; result:=0.0;
write ('Qual a cotação do dolar?: ');
readln (cotacao);
write ('Qual a quantidade de reais que você quer converter?: ');
readln (quant);
result:=(quant*cotacao);
write ('R$ ', quant:4:2,' equivalem a US$ ', result:4:2);
END.
