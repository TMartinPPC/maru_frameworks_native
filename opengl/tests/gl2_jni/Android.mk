#########################################################################
# OpenGL ES JNI sample
# This makefile builds both an activity and a shared library.
#########################################################################
TOP_LOCAL_PATH:= $(call my-dir)

# Build activity

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_PACKAGE_NAME := GL2JNI

LOCAL_JNI_SHARED_LIBRARIES := libgl2jni

include $(BUILD_PACKAGE)

#########################################################################
# Build JNI Shared Library
#########################################################################

LOCAL_PATH:= $(LOCAL_PATH)/jni

include $(CLEAR_VARS)

# Optional tag would mean it doesn't get installed by default
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -Werror -Wno-error=unused-parameter

LOCAL_SRC_FILES:= \
  gl_code.cpp

LOCAL_SHARED_LIBRARIES := \
	libutils \
	liblog \
	libEGL \
	libGLESv2

LOCAL_MODULE := libgl2jni



include $(BUILD_SHARED_LIBRARY)
