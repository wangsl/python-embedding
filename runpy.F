

      Subroutine RunPy(PyScript, PyFunction, X, Nx, Y, Ny)
      Implicit None
      Character*(*) PyScript, PyFunction
      Real*8 X(*), Y(*)
      Integer Nx, Ny
      
      Integer I, Len, LinEnd
      External LinEnd
      Integer LenPyScript, LenPyFunction
      
      LenPyScript = LinEnd(PyScript)
      If(PyScript(LenPyScript-2:LenPyScript) .eq. '.py')
     $     LenPyScript = LenPyScript-3
      
      LenPyFunction = LinEnd(PyFunction)
      
      Call Flush(6)
      
      Call PyTest(PyScript, LenPyScript,
     $     PyFunction, LenPyFunction,
     $     X, Nx, Y, Ny)
      
      Return
      End
