## Random data generator
This is a simple random data generator.  I needed something to quickly generate billions of simple, random records for database experimentation.

The data is the freely available US Census data from 2000.  

## To run
    ./makefake --records 5000000000 --fields surname,city,zip > test_data.csv

## License
MIT Licensed.
