/*
 * sem título.c
 * 
 * Copyright 2013 Kemel Zaidan <kemel@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */


#include <stdio.h>

int meu_biosequip()
{
/*This function returns the equipment word from BIOS request 0x11*/

//aqui vamos escrever código assembly para chamar a interrupção número 0x11,
// que é a interrupção que a BIOS implementa para te passar informações sobre
// os equipamentos de hardware instalados no computador.

//veja o link: http://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C

    //abaixo, vamos chamar por software a execução da interrupção número 0x11
    // o resultado disso será um valor salvo no registrador AX contendo os dados sobre equipamentos disponíveis no computador
    // O resultado é então copiado para a variável inteira equipment

	int equipment;
	__asm__ ( "int 0x11;"
				"movw %%ax" : "=r" ( equipment ));    
    
	return equipment;
}


int main(){
//http://vitaly_filatov.tripod.com/ng/asm/asm_001.9.html

	int equip = meu_biosequip();

	printf("diskete present: %s\n", equip & 1 ? "True" : "False");
	equip >>=1; //skip the 1 bit of diskete data
	printf("Math coprocessor installed: %s\n", equip & 1 ? "True" : "False");
	equip >>=3; //skip the 1 bit of mathcoprocessor data and 2 bits of reserved fields
	printf("Initial video mode: %d\n", equip & 0b11);
	equip >>=2; //skip the 2 bits of videomode data
	printf("Number of disketes: %d\n", (equip & 0b11) + 1); //engraçado! 0 significa 1 disquete. Eles não imaginavam a possibilidade de não ter disquete no computador...
	equip >>=3; //skip the 2 bits of numdisketes data and 1 bit of reserved field
	printf("Number of RS-232 ports: %d\n", equip & 0b111);
	equip >>=3; //skip the 3 bits of RS232 ports data
	printf("Game adapter installed: %s\n", equip & 0b1 ? "True" : "False"); //always true on PCJr
	equip >>=1; //skip the 1 bits of gameadapter data
	printf("Internal modem installed: %s\n", equip & 0b1 ? "True" : "False");
	equip >>=1; //skip the 1 bits of internal modem data
	printf("Number of printers installed: %d\n", equip & 0b11);

	return 0;	
}
