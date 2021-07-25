

      Subroutine RunPy(PyScript, PyFunction, X, Nx)
      Implicit None
      Character*(*) PyScript, PyFunction
      Real*8 X(*)
      Integer Nx
      
      Integer I, Len, LinEnd
      External LinEnd
      Integer LenPyScript, LenPyFunction
      
      LenPyScript = LinEnd(PyScript)
      If(PyScript(LenPyScript-2:LenPyScript) .eq. '.py')
     $     LenPyScript = LenPyScript-3
      
      LenPyFunction = LinEnd(PyFunction)
      
      Call Flush
      
      Call PyTest(PyScript, LenPyScript,
     $     PyFunction, LenPyFunction,
     $     X, Nx)
      
      Return
      End
