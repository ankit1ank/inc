#include <stdio.h>

extern int scheme_entry();

#define bool_f     0b00101111
#define bool_t     0b01101111
#define boolshift           7
#define booltag    0b00011111
#define charmask   0b00111111
#define fxmask     0b00000011
#define charshift           8
#define chartag    0b00001111
#define fxshift             2
#define fxtag               0
#define list_nil   0b00111111

int main() {
    int val = scheme_entry();

    if ((val & fxmask) == fxtag) {
        printf("%d\n", val >> fxshift);

    } else if (val == bool_t) {
        printf("#t\n");

    } else if (val == bool_f) {
        printf("#f\n");

    } else if (val == list_nil) {
        printf("()\n");

    } else {
        printf("ERROR\n");
    }
}
