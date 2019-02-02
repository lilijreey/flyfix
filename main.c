
#include <unistd.h>
#include "code1.h"

int main()
{
    while (1)
    {
        int i = fn1();
        fn2(i);
        sleep(1);
    }

}
