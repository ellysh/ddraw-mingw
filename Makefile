include Makefile.mingw

CXXFLAGS+=-Wall -I/usr/include/wine/windows
LDADD+=-lgdi32 -luser32 -lddraw libuuid.cross.a

OBJECTS=BasicDD.o cSurface.o
RES=resource.rc

all: test.exe

test.exe: $(OBJECTS) $(RES).res.o
	$(CXX) $^ -o $@ $(LDADD)

$(RES).res.o: $(RES)
	$(WINDRES) $^ $@

clean:
	rm -f $(OBJECTS) $(RES).res.o test.exe
