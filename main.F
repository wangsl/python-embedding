

      SubRoutine PrintX(N, X)
      Implicit None
      Integer N
      Real*8 X(*)
      Integer I

      Do I = 1, N
         Write(6, *) I, X(I)
      EndDo

      Call Flush(6)

      Return
      End
      

      Program Main
      Implicit None
      Integer N
      Parameter(N = 15)
      Real*8 X(N)
      Integer I, J

      Do I = 1, N
         X(I) = DBLE(I)
      EndDo
      
      Call PrintX(N, X)

      Do J = 1, 10
         Write(6, *)
         Write(6, *) 'Loop: ', J
         Call RunPy('test.py', 'my_test', X, N)
         Call PrintX(n, x)
      EndDo

      Call PyFinalize
      
      End


