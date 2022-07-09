CC = g++

#PWD = $(CURDIR)		#CURDIR is a special macro in makefile, it means pwd.

BIN_DIR = $(CURDIR)/build
INC_DIR = $(CURDIR)/inc
SRC_DIR = $(CURDIR)/src
OBJ_DIR = $(CURDIR)/obj
LIBRARY_DIR = $(CURDIR)/opensource

SRC = $(wildcard $(SRC_DIR)/*.cpp)		#wildcard 意即通配符
OBJ = $(OBJ_DIR)/$(patsubst %.cpp,%.o,$(notdir $(SRC)))


TARGET = $(BIN_DIR)/target
LIBRARY = library
PRINT = print

CXXFLAGS = -c -O -g -Wall 

INCFLAG += -I $(INC_DIR)
INCFLAG += -I $(CURDIR)/opensource/include	#INCFLAGS包含头文件


LDFLAGS += -L$(CURDIR)/opensource/lib	#LDFALGS 包含lib路径
LDFLAGS += -llhhadd
LDFLAGS += -ljuu



$(TARGET) : $(PRINT) $(LIBRARY)  $(OBJ)
	@echo "TARGET >>"
	$(CC) $(OBJ)  -o $@  $(LDFLAGS)						# LDFLAGS包含了[-L库目录]和[-l库]
	@echo "Compile done."
	@echo ""

#$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp
$(OBJ) : $(SRC)
	@echo "OBJ >>"
	$(CC) $(CXXFLAGS) $(INCFLAG)-c $^ -o $@		# INCFLAGS包含了静态库+动态库头文件
	@echo "OBJ <<"
	@echo ""

$(LIBRARY) : 
	@echo "LIBRARY >>"
	cd $(LIBRARY_DIR) && make
	@echo "$(CURDIR)"
	@echo "LIBRARY <<"
	@echo ""

$(PRINT):
	$(info "SRC is          " $(SRC))
	$(info "OBJ is          " $(OBJ))
	$(info )


.PHONY:clean

clean:
	@echo "clean >>"
	$(RM) $(TARGET) $(OBJ)
	@echo ""
	@cd $(LIBRARY_DIR);make clean_opensource
	@echo ""
	@echo "clean <<"
	@echo ""
	