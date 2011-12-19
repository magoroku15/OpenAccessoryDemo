#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 

# Macros
CND_CONF=dsPIC33EP512MU810_PIM
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/_ext/1991243579/usb_host_android.o ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o ${OBJECTDIR}/_ext/926206843/usb_host.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=C:\\Program\ Files\\Java\\jdk1.6.0_24\\jre/bin/
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin\\pic30-gcc.exe
# MP_BC is not defined
MP_AS=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin\\pic30-as.exe
MP_LD=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin\\pic30-ld.exe
MP_AR=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin\\pic30-ar.exe
# MP_BC is not defined
MP_CC_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin
# MP_BC_DIR is not defined
MP_AS_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin
MP_LD_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin
MP_AR_DIR=C:\\Program\ Files\ \(x86\)\\Microchip\\mplabc30\\v3.30c\\bin
# MP_BC_DIR is not defined

.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-dsPIC33EP512MU810_PIM.mk dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=33EP512MU810
MP_LINKER_FILE_OPTION=,-Tp33EP512MU810.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c    2>&1  > ${OBJECTDIR}/_ext/1472/main.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/main.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/main.o.err 
	@cat ${OBJECTDIR}/_ext/1472/main.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/main.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1991243579/usb_host_android.o: ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1991243579 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c    2>&1  > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@cat ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/926206843/usb_host.o: ../../../../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/926206843 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/926206843/usb_host.o.d -o ${OBJECTDIR}/_ext/926206843/usb_host.o ../../../../Microchip/USB/usb_host.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/926206843/usb_host.o.d -o ${OBJECTDIR}/_ext/926206843/usb_host.o ../../../../Microchip/USB/usb_host.c    2>&1  > ${OBJECTDIR}/_ext/926206843/usb_host.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/926206843/usb_host.o.d > ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/926206843/usb_host.o.d > ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@cat ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@if [ -f ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/926206843/usb_host.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c    2>&1  > ${OBJECTDIR}/_ext/1472/usb_config.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/usb_config.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@cat ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o: ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1991243579 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c    2>&1  > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@cat ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok; else exit 1; fi
	
else
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c    2>&1  > ${OBJECTDIR}/_ext/1472/main.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/main.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/main.o.err 
	@cat ${OBJECTDIR}/_ext/1472/main.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/main.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1991243579/usb_host_android.o: ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1991243579 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android.c    2>&1  > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@cat ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1991243579/usb_host_android.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/926206843/usb_host.o: ../../../../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/926206843 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/926206843/usb_host.o.d -o ${OBJECTDIR}/_ext/926206843/usb_host.o ../../../../Microchip/USB/usb_host.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/926206843/usb_host.o.d -o ${OBJECTDIR}/_ext/926206843/usb_host.o ../../../../Microchip/USB/usb_host.c    2>&1  > ${OBJECTDIR}/_ext/926206843/usb_host.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/926206843/usb_host.o.d > ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/926206843/usb_host.o.d > ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp ${OBJECTDIR}/_ext/926206843/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/926206843/usb_host.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@cat ${OBJECTDIR}/_ext/926206843/usb_host.o.err 
	@if [ -f ${OBJECTDIR}/_ext/926206843/usb_host.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/926206843/usb_host.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c    2>&1  > ${OBJECTDIR}/_ext/1472/usb_config.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/usb_config.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@cat ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o: ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1991243579 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -DDSPIC33EP512MU810_PIM -I".." -I"../../../../Microchip/Include" -MMD -MF ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d -o ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o ../../../../Microchip/USB/Android\ Host\ Driver/usb_host_android_protocol_v1.c    2>&1  > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d > ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${CP} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@cat ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1991243579/usb_host_android_protocol_v1.o.ok; else exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=3000,--no-check-sections,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=3000,--no-check-sections,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.elf -omf=elf
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/dsPIC33EP512MU810_PIM
	${RM} -r dist/dsPIC33EP512MU810_PIM

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
