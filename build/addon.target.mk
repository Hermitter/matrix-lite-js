# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := addon
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=addon' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Debug := \
	-I/home/pi/.node-gyp/11.8.0/include/node \
	-I/home/pi/.node-gyp/11.8.0/src \
	-I/home/pi/.node-gyp/11.8.0/deps/openssl/config \
	-I/home/pi/.node-gyp/11.8.0/deps/openssl/openssl/include \
	-I/home/pi/.node-gyp/11.8.0/deps/uv/include \
	-I/home/pi/.node-gyp/11.8.0/deps/zlib \
	-I/home/pi/.node-gyp/11.8.0/deps/v8/include \
	-I$(srcdir)/node_modules/nan

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=addon' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Release := \
	-I/home/pi/.node-gyp/11.8.0/include/node \
	-I/home/pi/.node-gyp/11.8.0/src \
	-I/home/pi/.node-gyp/11.8.0/deps/openssl/config \
	-I/home/pi/.node-gyp/11.8.0/deps/openssl/openssl/include \
	-I/home/pi/.node-gyp/11.8.0/deps/uv/include \
	-I/home/pi/.node-gyp/11.8.0/deps/zlib \
	-I/home/pi/.node-gyp/11.8.0/deps/v8/include \
	-I$(srcdir)/node_modules/nan

OBJS := \
	$(obj).target/$(TARGET)/hal_wrapper/matrix.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/everloop.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/gpio.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/sensors/humidity.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/sensors/imu.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/sensors/pressure.o \
	$(obj).target/$(TARGET)/hal_wrapper/drivers/sensors/uv.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic

LDFLAGS_Release := \
	-pthread \
	-rdynamic

LIBS := \
	-lmatrix_creator_hal

$(obj).target/addon.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/addon.node: LIBS := $(LIBS)
$(obj).target/addon.node: TOOLSET := $(TOOLSET)
$(obj).target/addon.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/addon.node
# Add target alias
.PHONY: addon
addon: $(builddir)/addon.node

# Copy this to the executable output path.
$(builddir)/addon.node: TOOLSET := $(TOOLSET)
$(builddir)/addon.node: $(obj).target/addon.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/addon.node
# Short alias for building this executable.
.PHONY: addon.node
addon.node: $(obj).target/addon.node $(builddir)/addon.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/addon.node

