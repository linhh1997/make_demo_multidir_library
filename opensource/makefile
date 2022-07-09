CC := g++
AR := ar

OPEN_DIR = $(CURDIR)

LHHADD_LIB :=$(OPEN_DIR)/lib/liblhhadd.a
LHHADD_OBJ :=$(OPEN_DIR)/obj/lhhadd.o

JUU_LIB :=$(OPEN_DIR)/lib/libjuu.so
JUU_OBJ :=$(OPEN_DIR)/obj/juu.o

PRINT := print

LHHADD_CODE_DIR := $(OPEN_DIR)/lhhadd
JUU_CODE_DIR := $(OPEN_DIR)/juu

all : $(PRINT) $(LHHADD_LIB) $(JUU_LIB)  cpjuulib

#LHHADD_LIB>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
$(LHHADD_LIB) : $(LHHADD_OBJ)
	@echo "LHHADD_LIB>>"
	$(AR) -crv $@ $(LHHADD_OBJ)  
	@echo "LHHADD_LIB<<"
	@echo ""
# $(AR) -crv liblhhadd.a lhhadd.o

$(LHHADD_OBJ) : $(LHHADD_CODE_DIR)/*.cpp
	@echo "LHHADD_OBJ >>"
	$(CC) -c $^ -o $@
	@echo "LHHADD_OBJ<<"
	@echo ""
#LHHADD_LIB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#JUU_LIB>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
$(JUU_LIB) : $(JUU_OBJ)
	@echo "JUU_LIB>>"
	$(CC) $(JUU_OBJ) -o $@ -shared -fPIC

	@echo "JUU_LIB<<"
	@echo ""

$(JUU_OBJ) : $(JUU_CODE_DIR)/*.cpp
	@echo "JUU_OBJ>>"
	$(CC) -c $^ -o $@ -fPIC
	@echo "JUU_OBJ<<"
	@echo ""

#JUU_LIB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

$(PRINT):
	$(info "OPEN_DIR is  " $(OPEN_DIR))
	$(info "LHHADD_LIB is    " $(LHHADD_LIB))
	$(info "LHHADD_OBJ is " $(LHHADD_OBJ))
	$(info "LHHADD_CODE_DIR is " $(LHHADD_CODE_DIR))
	$(info "JUU_LIB is  " $(JUU_LIB))
	$(info "JUU_OBJ is  " $(JUU_OBJ))
	$(info "JUU_CODE_DIR is  " $(JUU_CODE_DIR))
	$(info )

.PHONY:clean_opensource cpjuulib rmjuulib

clean_opensource:rmjuulib
	@echo "clean_opensource >>"
	$(RM)  $(LHHADD_LIB) $(LHHADD_OBJ) $(LHHADD_CODE_DIR)/*.gch
	$(RM)  $(JUU_LIB) $(JUU_OBJ) $(JUU_CODE_DIR)/*.gch
	@echo "clean_opensource <<"

cpjuulib:
	$(shell echo "xxx" | sudo -S cp $(JUU_LIB)  /usr/lib/)

rmjuulib:
	$(shell echo "xxx" | sudo -S rm -rf /usr/lib/libjuu.so)
