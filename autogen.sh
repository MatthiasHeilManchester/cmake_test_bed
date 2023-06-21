#! /bin/bash

#-----------------------------------------------------------------
# Fake autogen.sh script to illustrate cmake-based build process
#-----------------------------------------------------------------

# Wipe
rm -rf build


minus_d_thing=""
loop_list="0 1"
for loop in $loop_list; do


    if [ $loop -eq 0 ]; then
        echo " "
        echo "NO SPECIFICIATION OF CXX FLAGS FROM CMAKE COMMAND LINE"
        echo " "
    else
        echo " "
        echo "SPECIFYING CXX FLAGS FROM CMAKE COMMAND LINE: $minus_d_thing"
        echo " "
    fi
    # Configure
    cmake -B build -G Ninja $minus_d_thing

    
    # Build
    cd build
    
    # Verbose shows us what's actually going on so we can see warnings etc.
    ninja --verbose
    
    
    # Run
    ./cpp_demo
    ./cpp_demo_O6_blabla

    minus_d_thing=" -D CMAKE_CXX_FLAGS=\"-pg\""

    cd ..

done
