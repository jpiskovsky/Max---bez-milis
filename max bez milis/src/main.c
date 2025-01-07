#include <stdbool.h>
#include <stm8s.h>
#include <stdio.h>
#include "main.h"
#include "milis.h"
//#include "delay.h"
#include "max7219.h"

uint32_t vlastni_cas = 0;



void init(void) {
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovani MCU na 16MHz

    GPIO_Init(DIN_PORT, DIN_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
    GPIO_Init(CS_PORT, CS_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
    GPIO_Init(CLK_PORT, CLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);

    //init_milis();
}



void display(uint8_t address, uint8_t data) {
    uint8_t mask;
    LOW(CS); // začátek přenosu

    /* pošlu adresu */
    mask = 128;
    mask = 1 << 7;
    mask = 0b10000000;
    while (mask) {
        if (address & mask) {
            HIGH(DIN);
        } else {
            LOW(DIN);
        }
        HIGH(CLK);
        mask = mask >> 1;
        LOW(CLK);
    }
    /* pošlu data */
    mask = 0b10000000;
    while (mask) {
        if (data & mask) {
            HIGH(DIN);
        } else {
            LOW(DIN);
        }
        HIGH(CLK);
        mask = mask >> 1;
        LOW(CLK);
    }

    HIGH(CS); // konec přenosu
}
void TIM2_init(void)
{
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,ENABLE);
    TIM2_TimeBaseInit(TIM2_PRESCALER_16,999);
    TIM2_ClearFlag(TIM2_FLAG_UPDATE);
    TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
    TIM2_Cmd(ENABLE);
}

int main(void) {

    uint32_t time = 0;
    uint8_t number = 0;
    uint16_t number1 = 000;
    uint16_t vysledek;
    uint16_t vysledek1;
    uint16_t n;
    init();
    TIM2_init();

    display(DECODE_MODE, 0b11111111);
    display(SCAN_LIMIT, 7);
    display(INTENSITY, 1);
    display(DISPLAY_TEST, DISPLAY_TEST_OFF);
    display(SHUTDOWN, SHUTDOWN_ON);
    display(DIGIT0, 0xF);
    display(DIGIT1, 0xF);
    display(DIGIT2, 0xF);
    display(DIGIT3, 0xF);
    display(DIGIT4, 0xF);
    display(DIGIT5, 0xF);
    display(DIGIT6, 0xF);
    display(DIGIT7, 0xF);

    while(1){

        if (vlastni_cas - time > 300){
            time = vlastni_cas;
            display(DIGIT0, number);
            number ++;

            if(number>9){
                number=0;
            }


            vysledek = number1/100;
            
            display(DIGIT6, vysledek);

            n= number1%100;
            vysledek1 = n/10;

            display(DIGIT5, vysledek1);

            n= number1%10;
            display(DIGIT4, n);

            number1 ++;

            if(number1>999){
                number1 = 0;
            }
        }
        
    }
}