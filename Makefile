CXX = g++ # Compiler
CXXFLAGS = -Wall #Flags

# Directories
BIN_DIR = ./bin
DATA_DIR = ./data
INCLUDE_DIR = ./include
OBJ_DIR = ./obj
SRC_DIR = ./src
##

SRCS = $(wildcard $(SRC_DIR)/*.cpp) # Searches for all the .cpp files in (SRC_DIR) and lists them.
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS)) # Takes the text from (SRCS) and substitues the .cpp pattern with the .o pattern.
INCLUDES = $(wildcard $(INCLUDE_DIR)/*.h) # Searches for all the .h files in (INCLUDE_DIR) and lists them.

TARGET = $(BIN_DIR)/tp1 #Executable name.

# Rules
main : $(TARGET)

$(TARGET) : $(OBJS)
	$(CXX) $(FLAGS) $(OBJS) -o $(TARGET)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp $(INCLUDES)
	$(CXX) $(FLAGS) -I $(INCLUDE_DIR) -c $< -o $@

clean:
	rm $(OBJS) $(TARGET)

valgrind1:
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt $(TARGET) -c os_lusiadas.txt -o output.z78

valgrind2:
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt $(TARGET) -x output.z78 -o output.txt

compress1 :
	$(TARGET) -c os_lusiadas.txt -o output.z78

compress2 :
	$(TARGET) -c constituicao1988.txt -o output.z78

compress3 :
	$(TARGET) -c dom_casmurro.txt -o output.z78

decompress :
	$(TARGET) -x output.z78 -o output.txt
##