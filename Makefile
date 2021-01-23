.PHONY: lib

TLPI_DIR = ./lib/
TLPI_LIB = ./lib/libtlpi.a
TLPI_INCL_DIR = ${TLPI_DIR}/lib

include ./lib/Makefile.inc

GEN_EXE = atomic_append bad_exclusive_open copy \
	multi_descriptors seek_io t_readv t_truncate

LINUX_EXE = large_file

EXE = ${GEN_EXE} ${LINUX_EXE}

all : lib exe

exe : ${EXE}

allgen : ${GEN_EXE}

clean : clean_local clean_lib

lib:
	$(MAKE) -C lib

clean_lib : 
	$(MAKE) clean -C lib

clean_local : 
	${RM} ${EXE} *.o

showall :
	@ echo ${EXE}

${EXE} : ${TLPI_LIB}		# True as a rough approximation
