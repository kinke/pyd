module python2.import_;

import python2.types;
import python2.object;

extern(C):
// Python-header-file: Include/import.h:

C_long PyImport_GetMagicNumber();
PyObject* PyImport_ExecCodeModule(char* name, PyObject* co);
PyObject* PyImport_ExecCodeModuleEx(char* name, PyObject* co, char* pathname);
PyObject* PyImport_GetModuleDict();
PyObject* PyImport_AddModule(Char1* name);
PyObject* PyImport_ImportModule(Char1* name);

version(Python_2_5_Or_Later){
    PyObject* PyImport_ImportModuleLevel(char* name,
            PyObject* globals, PyObject* locals, PyObject* fromlist, 
            int level);
}
version(Python_2_6_Or_Later){
    PyObject*  PyImport_ImportModuleNoBlock(const(char)*);
}
version(Python_2_5_Or_Later){
    PyObject* PyImport_ImportModuleEx()(char* n, PyObject* g, PyObject* l, 
            PyObject* f) {
        return PyImport_ImportModuleLevel(n, g, l, f, -1);
    }
}else{
    PyObject* PyImport_ImportModuleEx(char* , PyObject* , PyObject* , PyObject* );
}

version(Python_2_6_Or_Later){
    PyObject*  PyImport_GetImporter(PyObject* path);
}
PyObject* PyImport_Import(PyObject* name);
PyObject* PyImport_ReloadModule(PyObject* m);
void PyImport_Cleanup();
int PyImport_ImportFrozenModule(char* );

// The following API members are undocumented, so they're omitted here:
// _PyImport_FindModule
// _PyImport_IsScript
// _PyImport_ReInitLock

PyObject* _PyImport_FindExtension(char* , char* );
PyObject* _PyImport_FixupExtension(char* , char* );

struct _inittab {
    char* name;
    void function() initfunc;
}

__gshared PyTypeObject PyNullImporter_Type;
__gshared _inittab* PyImport_Inittab;

version(Python_2_7_Or_Later){
    alias const(char) Char2;
}else{
    alias char Char2;
}

int PyImport_AppendInittab(Char2 *name, void function() initfunc);
int PyImport_ExtendInittab(_inittab *newtab);

struct _frozen {
    char* name;
    ubyte *code;
    int size;
}

__gshared _frozen* PyImport_FrozenModules;
