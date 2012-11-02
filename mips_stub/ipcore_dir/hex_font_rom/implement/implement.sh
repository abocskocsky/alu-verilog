#!/bin/sh

# Clean up the results directory
rm -rf results
mkdir results

#Synthesize the Wrapper Files

echo 'Synthesizing example design with XST';
xst -ifn xst.scr
cp hex_font_rom_top.ngc ./results/


# Copy the netlist generated by Coregen
echo 'Copying files from the netlist directory to the results directory'
cp ../../hex_font_rom.ngc results/

#  Copy the constraints files generated by Coregen
echo 'Copying files from constraints directory to results directory'
cp ../example_design/hex_font_rom_top.ucf results/

cd results

echo 'Running ngdbuild'
ngdbuild -p xc6slx45-csg324-3 hex_font_rom_top

echo 'Running map'
map hex_font_rom_top -o mapped.ncd -pr i

echo 'Running par'
par mapped.ncd routed.ncd

echo 'Running trce'
trce -e 10 routed.ncd mapped.pcf -o routed

echo 'Running design through bitgen'
bitgen -w routed

echo 'Running netgen to create gate level Verilog model'
netgen -ofmt verilog -sim -tm hex_font_rom_top -pcf mapped.pcf -w -sdf_anno false routed.ncd routed.v
