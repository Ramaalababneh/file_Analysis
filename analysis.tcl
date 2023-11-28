proc isInteger {val} {
    return [regexp {^-?\d+$} $val]
}
proc isFloat {val} {
    return [regexp {^-?\d+\.\d+$} $val]
}

set sum 0
set stringCount 0

set filename "input.txt"
set file [open $filename]

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

close $file
puts "Sum of integers: $sum"
puts "Count of lines that present a string value: $stringCount"
