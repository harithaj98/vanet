#Filename: sybil_attack.tcl

set attacker 8

for { set k 0 } { $k < 5} { incr k } {
set udp1 [new Agent/UDP]
$ns_ attach-agent $node_($attacker) $udp1
set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 512
$cbr1 set interval_ 0.5
$cbr1 attach-agent $udp1
set null1 [new Agent/Null]
$ns_ attach-agent $node_($rsu) $null1
$ns_ connect $udp1 $null1
$ns_ at [expr $now ] "$cbr1 start"
$ns_ at [expr $now + 1.0] "$cbr1 stop"
}
$ns_ at $now "$ns_ trace-annotate \"Attacker Pretends like multiple vehicle and
send message to RSU\""
