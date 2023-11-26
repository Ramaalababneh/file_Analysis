# Function to determine if a value is an integer
proc isInteger {val} {
    return [regexp {^-?\d+$} $val]
}

# Function to determine if a value is a float
proc isFloat {val} {
    return [regexp {^-?\d+\.\d+$} $val]
}

# Initialize sum and string count
set sum 0
set stringCount 0

# Open the file
set filename "input.txt"
set file [open $filename]

# Process each line
while {[gets $file line] >= 0} {
    if { [isInteger $line] } {
        if { [expr {$line % 2}] == 0 } {
            set line [expr {$line * 2}]
            puts $line
            incr sum [expr {$line}]  
        } else {
            set line [expr {$line * 3}]
            puts $line
            incr sum [expr {$line}]  
        }
    } elseif { [isFloat $line] || ![regexp {\d} $line] } {
        puts $line
        if { ![isFloat $line] } {
            incr stringCount
        }
    } else {
        puts "INVALID"
    }
}
# Close the file
close $file

# Output the sum and string count
puts "Sum of integers: $sum"
puts "Count of lines that present a string value: $stringCount"