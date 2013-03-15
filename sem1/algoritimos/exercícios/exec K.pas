program exerc_K;

var cotacao, quant, result : real;

BEGIN
cotacao:=0.0; quant:=0.0; result:=0.0;
write ('Qual a cotação do dolar?: ');
readln (cotacao);
write ('Qual a quantidade de dólares que você quer converter?: ');
readln (quant);
result:=(quant*cotacao);
write ('US$ ', quant:4:2,' equivalem a R$ ', result:4:2);
END.
