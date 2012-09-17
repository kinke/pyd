module deimos.python.memoryobject;

import deimos.python.pyport;
import deimos.python.object;

extern(C):
// Python-header-file: Include/memoryobject.h:
version(Python_2_7_Or_Later) {
    __gshared PyTypeObject PyMemoryView_Type;

    int PyMemoryView_Check()(PyObject* op) {
        return Py_TYPE(op) == &PyMemoryView_Type;
    }

    auto PyMemoryView_GET_BUFFER()(PyObject* op) {
        return &(cast(PyMemoryViewObject*)op).view;
    }

    auto PyMemoryView_GET_BASE()(PyObject* op) {
        return (cast(PyMemoryViewObject*) op).view.obj;
    }

    PyObject* PyMemoryView_GetContiguous(PyObject* base,
            int buffertype, char fort);

    PyObject* PyMemoryView_FromObject(PyObject* base);

    PyObject* PyMemoryView_FromBuffer(Py_buffer* info);

    struct PyMemoryViewObject {
        mixin PyObject_HEAD;
        version(Python_3_0_Or_Later) {
        }else{
            PyObject* base;
        }
        Py_buffer view;
    }

}
