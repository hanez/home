#!/bin/sh

output="/var/www/localhost/htdocs/stats/"
nic="eth0"
name=$(hostname)

generate_index() {
	cat <<-EOF
	<!doctype html>
	<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="cache-control" content=no-cache">
	    <meta http-equiv="refresh" content="3000">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>$name: $nic network statistics</title>
	</head>
	<body style="background-color:#444">
	    <div style="text-align:center">
	        <div><img src="summary.png" alt="summary"></div>
	        <div><img src="fiveminutes.png" alt="summary"></div>
            <div><img src="hours.png" alt="hours"></div>
            <div><img src="hoursgraph.png" alt="hours"></div>
	        <div><img src="days.png" alt="days"></div>
	        <div><img src="top.png" alt="days"></div>
	        <div><img src="months.png" alt="months"></div>
	        <div><img src="years.png" alt="months"></div>
	    </div>
	</body>
	</html>
	EOF
}

#if  [ ! -f "$output"/index.html ]; then
	mkdir -p $output
	generate_index > "$output"/index.html
#fi

for type in fiveminutes hours hoursgraph days top months years summary hsummary vsummary; do
    vnstati --${type} -i $nic -o $output/${type}.png
done
