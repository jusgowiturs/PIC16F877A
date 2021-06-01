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

   lcd_init();

   while(TRUE)
   {
    if(input(PIN_A0)==0)
   {
      puts("KEC");
      LCD_PUTC("\fKEC");
     // delay_ms(100);
   }
   else
   {
      puts("III C");
      LCD_PUTC("\fIII C");
      //delay_ms(100);
   }
      //TODO: User Code
   }

}
