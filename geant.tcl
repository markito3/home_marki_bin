#!/usr/bin/expect --
set timeout 30
spawn ./Configure -build
expect "\[Type carriage return to continue\]"
send "\r"
expect "\[Type carriage return to continue\]"
send "\r"
expect "\[Type carriage return to continue\]"
send "\r"
expect " for default settings"
send "\r"
expect "Do you expect to run these scripts and binaries on multiple machines"
send "y\r"
expect "Where is Geant4 source installed?"
send "\r"
expect "Specify the path where Geant4 libraries and source files should be"
send "\r"
expect "Do you want to copy all Geant4 headers"
expect "in one directory?"
send "\r"
expect "Please, specify default directory where ALL the Geant4 data is installed"
expect "You will be asked about customizing these next"
send "\r"
expect "doesn\'t exist.  Use that name anyway?"
send "y\r"
expect "Please, specify default directory where the Geant4 data is installed:"
expect "for default settings"
send "\r"
expect "Could not find CLHEP installed on this system"
expect "/usr/local"
send "/usr/local/clhep/1.9.2.1\r"
expect "You can customize paths and library name of you CLHEP installation"
expect "for default settings"
send "\r"
expect "Do you want to build \'shared\' (.so) libraries?"
send "\r"
expect "Do you want to build \'global\' compound libraries?"
send "\r"
expect "Do you want to compile libraries in DEBUG mode"
send "\r"
expect "G4UI_NONE"
send "\r"
expect "G4UI_BUILD_XAW_SESSION"
expect "G4UI_USE_XAW"
send "y\r"
expect "G4UI_BUILD_XM_SESSION"
expect "G4UI_USE_XM"
send "y\r"
expect "G4VIS_NONE"
send "\r"
expect "G4VIS_BUILD_OPENGLX_DRIVER"
expect "G4VIS_USE_OPENGLX"
send "y\r"
expect "G4VIS_BUILD_OPENGLXM_DRIVER"
expect "G4VIS_USE_OPENGLXM"
send "y\r"
expect "G4VIS_BUILD_DAWN_DRIVER"
expect "G4VIS_USE_DAWN"
send "y\r"
expect "G4VIS_BUILD_OIX_DRIVER"
expect "G4VIS_USE_OIX"
send "\r"
expect "G4VIS_BUILD_VRML_DRIVER"
expect "G4VIS_USE_VRML"
send "y\r"
expect "OGLHOME/include"
expect "OGLHOME/lib"
send "\r"
expect "Specify the correct path \(OGLHOME\) where OpenGL is installed in your system."
send "\r"
expect "G4LIB_BUILD_G3TOG4"
send "\r"
expect "G4LIB_BUILD_ZLIB"
send "y\r"
expect "G4ANALYSIS_USE"
send "y\r"
interact
