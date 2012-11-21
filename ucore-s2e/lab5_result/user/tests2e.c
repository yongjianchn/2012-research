#include <stdio.h>
#include <string.h>
#include "s2e.h"

int main(void)
{
  char str[3],buf[4];
  // printf("Enter two characters: ");
  // if(!fgets(str, sizeof(str), stdin))
  //   return 1;

  s2e_enable_forking();
  s2e_make_symbolic(str, 2, "str");

  if(str[0] == 0 || str[1] == 0) {
    cprintf("Not enough characters\n");

  } else {
    if(str[0] >= 'a' && str[0] <= 'z')
      cprintf("First char is lowercase\n");
    else
      cprintf("First char is not lowercase\n");

    if(str[0] >= '0' && str[0] <= '9')
      cprintf("First char is a digit\n");
    else
      cprintf("First char is not a digit\n");

    if(str[0] == str[1])
      cprintf("First and second chars are the same\n");
    else
      cprintf("First and second chars are not the same\n");
  }

  s2e_disable_forking();

  s2e_get_example(str, 2);
  strcpy(buf,str);
  //cprintf("'%c%c' %02x %02x\n", str[0], str[1],
  //       (unsigned char) str[0], (unsigned char) str[1]);
  s2e_warning(buf);
  s2e_kill_state(0, "program terminated");
  return 0;
}
