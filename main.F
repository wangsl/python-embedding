

      SubRoutine PrintX(X, Nx)
      Implicit None
      Integer Nx
      Real*8 X(*)
      Integer I

      Do I = 1, Nx
         Write(6, *) I, X(I)
      EndDo

      Call Flush(6)

      Return
      End
      

      Program Main
      Implicit None
      Integer Nx
      Parameter(Nx = 15)
      Real*8 X(Nx)
      Integer I

      Do I = 1, Nx
         X(I) = DBLE(I)
      EndDo
      
      Call PrintX(X, Nx)

      Do I = 1, 10
         Write(6, *)
         Write(6, *) 'Loop: ', I
         Call RunPy('test.py', 'my_test', X, Nx)
         Call PrintX(X, Nx)
      EndDo

      Call PyFinalize
      
      End


