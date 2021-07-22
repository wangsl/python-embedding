
C     $Id: linend.F 72 2013-12-06 14:04:06Z wangsl $

      integer function linend(cline)
      implicit real*8(a-h,o-z)
c
c     function which returns the length of a character string,
c     excluding trailing blanks, tabs and nulls.
c
      character*(*) cline, blank
      character*1 null, tab
      parameter (blank=' ')
c
      null = char(0)
      tab = char(9)
      do 5 i = len(cline), 1, -1
          if(cline(i:i).ne.blank.and.
     $    cline(i:i).ne.null.and.
     $    cline(i:i).ne.tab) goto 10
    5     continue
      linend = 0
      return
   10 linend = i
      return
      end

#if 0      
      SubRoutine LinEnd2(CLine, Len)
      Implicit None
      Character*(*) CLine
      Integer Len
      Include 'linend.i'
      Len = LinEnd(CLine)
      Return
      End
#endif
