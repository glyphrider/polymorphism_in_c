#include "hello.h"

int main(int argc, char *argv[])
{
    void (*hello)(const char *);
    hello = &say_hello;

    (*hello)("pointer");
    return 0;
}
