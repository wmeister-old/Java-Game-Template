JAVA_BIN=$(shell which java)
JAVAC_BIN=$(shell which javac)
LIB_DIR=./lib
SRC_DIR=./src
NATIVES_DIR=$(LIB_DIR)/natives
LWJGL_JAR=$(LIB_DIR)/lwjgl.jar
SLICK_JAR=$(LIB_DIR)/slick.jar
JINPUT_JAR=$(LIB_DIR)/jinput.jar
JARS=$(LWJGL_JAR):$(SLICK_JAR):$(JINPUT_JAR)
CLASSPATH=$(JARS):$(SRC_DIR)
MAIN=Game

clean:
	find src/ -type f -name '*.class' | xargs rm

compile:
	find src/ -type f -name '*.java' | xargs $(JAVAC_BIN) -cp "$(JARS)"

run: compile
	env CLASSPATH="$(JARS):$(SRC_DIR)" LD_LIBRARY_PATH="$(NATIVES_DIR)" $(JAVA_BIN) -Dorg.lwjgl.util.Debug=true $(MAIN)
