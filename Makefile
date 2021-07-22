
# The integer number in this Makefile is I4, 
# please uncomment this line in WHAM.py
# from numpy import int32 as intpy

.DEFAULT: .f .for .c .C .cpp .cc
.SUFFIXES: .f .for .c .C .cpp .cc

O = .

F77 = gfortran
CC = gcc
CCC = g++ 

CFLAGS = -fPIC -O3 -I/ext3/miniconda3/include/python3.8 \
	-I/ext3/miniconda3/lib/python3.8/site-packages/numpy/core/include

FFLAGS = -fPIC -O3

LIBS = -L/ext3/miniconda3/lib -lpython3.8 -lstdc++
Link = $(F77) $(CFLAGS)

EXENAME = main.exe

OBJS =  $(O)/main.o  $(O)/runpy.o $(O)/pyext.o  $(O)/linend.o

$(EXENAME) : $(OBJS) 
	$(Link) -o $(EXENAME) $(OBJS) $(LIBS)

$(O)/%.o: %.c
	cd $(O) ; $(CC)  $(CFLAGS) -c $<
$(O)/%.o: %.cc
	cd $(O) ; $(CCC) $(CFLAGS) -c $<
$(O)/%.o: %.cpp
	cd $(O) ; $(CCC) $(CFLAGS) -c $<
$(O)/%.o: %.C
	cd $(O) ; $(CCC) $(CFLAGS) -c $<
$(O)/%.o: %.F
	cd $(O) ; $(F77) $(FFLAGS) -c $<
$(O)/%.o: %.for
	cd $(O) ; $(F77) $(FFLAGS) -c $<

clean:
	rm -f core *.o *.so
dat: 
	rm -f *.dat
backup:
	rm -f *~
clobber:
	rm -f $(EXENAME).exe
cleanall:
	rm -f *.o *.dat *~ *.exe *.exe.* $(EXENAME) *.pyc

.PRECIOUS: %_wrap.C %.C %.c %.f %.h $(O)/%.o
