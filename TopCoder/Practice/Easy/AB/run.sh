g++ ab.cpp -o ab
./ab > ab.cpp.csv

crystal build --release ab.cr
./ab > ab.cr.csv

ruby compare.rb ab.cpp.csv ab.cr.csv

# cleanup
rm ab.dwarf
rm ab.cpp.csv
rm ab.cr.csv
rm ab
