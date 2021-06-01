#include <main.h>
#define LCD_ENABLE_PIN PIN_B0
#define LCD_RS_PIN PIN_B2
#define LCD_RW_PIN PIN_B1
#define LCD_DATA4 PIN_B4
#define LCD_DATA5 PIN_B5
#define LCD_DATA6 PIN_B6
#define LCD_DATA7 PIN_B7

#include <lcd.c>

void main()
{
   char string[30];
   lcd_init();
   LCD_PUTC("Received Datas");
   while(TRUE)
   {
   //lcd_gotoxy(1,2);
   gets(string);
   printf(LCD_PUTC,"\f%s",string);
   
      //TODO: User Code
   }

}
