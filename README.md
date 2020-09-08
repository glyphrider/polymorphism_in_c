# Initial Commit

A working _hello world_ program (`demo`)

# Modular

Create a new module, `hello`, and move output logic there. Create a header file for the exported function, and extend the Makefile to link the new module.

# Function Pointer

Make the call from main to `say_hello` indirect, by means of a function pointer. This is a stepping stone toward a polymorphic implementation, but a worth waypoint since function pointers are a bit of a bugaboo to novice C programmers. The declaration of the function pointer looks like

```
void (hello*)(const char*);
```

The name of the pointer is `hello`; its strange position in the middle of the declaration is offputting to some. The return type is on the left, and the argument prototype(s) are on the right. The only difference between this an the prototype for `say_hello` in hello.h is the presence of the asterisk after the name and the parentheses wrapping the name and asterisk.

We assign a value to the pointer by taking the _addressof_ an actual function.

```
hello = &say_hello;
```

Then we can invoke the function pointer by dereferencing it, as we would with pointers to data values. Parentheses appear to enforce proper _order of operation s_.

```
(*hello)("pointer");
```

# Polymorphism (Rudimentary)

The project creates two shared objects (so files), which can be dynamically loaded. Each one exports a different implementation of the say_hello function. Using the commandline arguments (argc, argv), you can specify any arbitrary shared object to load, the program will attempt to map the function pointer to a say_hello export and invoke that function.

This new approach requires the libdl (dyanamic loading) and the dlfcn.h (dyanamic loaded functions) header file when building demo from main.c. The recipies for building the shared objects are a little cryptic, as the `-soname` option needs to be passed to the linker (via `-Wl`) with the value of the shared object's name; this results in the [potentially] confusing `-Wl,-soname,$@` flag when generating the shared object. Additionally, the `-shared` flag is needed at link time to let the linker know we want a shared object and not an executable.