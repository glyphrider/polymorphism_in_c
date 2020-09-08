#include <dlfcn.h>

#define SYM_NAME "say_hello"

int main(int argc, char *argv[])
{
  char *libname = argc>1?argv[1]:"./libhello1.so";

  void (*hello)(const char *);
  void *lib = dlopen(libname,RTLD_LAZY);
  hello = dlsym(lib,SYM_NAME);
  
  (*hello)("pointer");
  dlclose(lib);
  return 0;
}
