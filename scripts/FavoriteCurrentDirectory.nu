const favorite_paths_path = path self | path dirname | path dirname | path dirname | path join 'favorite_paths'

if not ($favorite_paths_path | path exists) {
	touch $favorite_paths_path
}

let favorite_paths = open $favorite_paths_path | lines

let current_path = pwd

if ($current_path in $favorite_paths) {
	print "Already favorited."
} else {
	$favorite_paths | append $current_path | sort | save -f $favorite_paths_path
	print "Path favorited."
}
