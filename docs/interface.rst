
Interfacing with C
===================
* Use ``matrixToPointer`` or ``!x`` to get the pointer to ``x.flat`` or ``x``
  (depending on 1D or 2D). I tried to use ``&`` as the address operator, but
  the build failed.
* Use ``pointerToMatrix`` to convert between a pointer returned from C and a
  matrix or matrix2d.
* Use ``copy(x, y)`` to copy ``x`` into ``y``. Useful for C that overwrites an
  array.
