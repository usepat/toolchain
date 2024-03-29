# https://askubuntu.com/questions/1243252/how-to-install-arm-none-eabi-gdb-on-ubuntu-20-04-lts-focal-fossa
# Also props to this guy, that made an awsome stackoverflow post

# Version can be set by supplying it with the -v flag

while getopts v: flag
do
    case "${flag}" in
        v) VER=${OPTARG};;
    esac
done
VER=${VER:-'13.2.Rel1'} # sets VER to this string, if it is not already set, null or empty.
# Yes, bash is very weird

TOOLCHAIN_NAME=arm-gnu-toolchain-${VER}-x86_64-arm-none-eabi
URL=https://developer.arm.com/-/media/Files/downloads/gnu/${VER}/binrel/${TOOLCHAIN_NAME}.tar.xz
# https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz?rev=e434b9ea4afc4ed7998329566b764309&hash=688C370BF08399033CA9DE3C1CC8CF8E31D8C441

cd /opt

echo "Downloading arm-gnu toolchain x86_64" 
echo "version: $VER"
wget "$URL"

echo "Extracting..."
tar xf ${TOOLCHAIN_NAME}.tar.xz
rm  ${TOOLCHAIN_NAME}.tar.xz


echo "Set PICO_TOOLCHAIN_PATH to /opt/$TOOLCHAIN_NAME/bin/"
source $(dirname $0)/def_env_var.sh
setEnvVar "PICO_TOOLCHAIN_PATH" "/opt/$TOOLCHAIN_NAME/bin/"
