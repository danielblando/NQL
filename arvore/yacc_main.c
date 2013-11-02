#include <stdio.h>


int main (void)
{
	switch( yyparse() )
	{
		case 0:
			printf("Programa finalizado corretamente\n");
			break;
		case 1:
			printf("Erro na leitura do programa\n");
			break;
		case 2:
			printf("Consumo de memoria excessivo.\n");
			break;
	}
	getchar();
	return 0;
}
