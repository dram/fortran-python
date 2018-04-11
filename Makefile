PROGRAM = tests/run-tests
MODULES_DIR = modules
OBJECT_FILES = sources/python.o tests/main.o

.PHONY: build clean run setup

build: setup ${PROGRAM}

run: build
	@${PROGRAM}

%.o: %.f90
	${CC} -std=f2008ts -Wall -J ${MODULES_DIR} -o $@ -c $^

${PROGRAM}: ${OBJECT_FILES}
	${CC} -o $@ $^ -lgfortran -lpython3.6m

setup: ${MODULES_DIR}

${MODULES_DIR}:
	mkdir -p $@

clean:
	rm -rf ${PROGRAM} ${OBJECT_FILES} ${MODULES_DIR}
