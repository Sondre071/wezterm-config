const favorite_paths_path = path self | path dirname | path dirname | path dirname | path join 'favorite_paths'

if not ($favorite_paths_path | path exists) {
    touch $favorite_paths_path
}

let favorite_paths = open $favorite_paths_path | lines

let current_path = pwd

let index = $favorite_paths | enumerate | where item == $current_path | get index | first

if ($index == null) {
    print "Already not favorited."
} else {
	$favorite_paths | enumerate | reject $index | get item | save -f $favorite_paths_path
    print "Path unfavorited."
}
