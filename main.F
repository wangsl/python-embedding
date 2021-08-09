

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
      Integer Nx, Ny
      Parameter(Nx = 15)
      Parameter(Ny = 15)
      Real*8 X(Nx), Y(Ny)
      Integer I

      Do I = 1, Nx
         X(I) = DBLE(I)
         Y(I) = 0.0D0
      EndDo
      
      Call PrintX(X, Nx)

      Do I = 1, 100
         Write(6, *)
         Write(6, *) 'Loop: ', I
         Call RunPy('test.py', 'my_test', X, Nx, Y, Ny)
         Call PrintX(X, Nx)
         Call PrintX(Y, Ny)
      EndDo

      Call PyFinalize
      
      End


