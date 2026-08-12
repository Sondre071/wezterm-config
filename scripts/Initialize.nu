## Move scripts

const current_dir = path self | path dirname
const terminal_data_dir = $current_dir | path dirname | path dirname | path join 'terminal'
const scripts_dir = $terminal_data_dir | path join 'scripts' 'Terminal'

if not ($scripts_dir | path exists) {
    mkdir $scripts_dir
}

const scripts_to_copy = ['FavoriteCurrentDirectory.nu', 'UnfavoriteCurrentDirectory.nu']

$scripts_to_copy | each {|file| 
    let target_path = $"($scripts_dir)/($file)"

    if not ($target_path | path exists) {
        ln -s $"($current_dir)/($file)" $target_path
        print $"Created ($target_path)"
    } else {
        print $"File already exists: ($target_path). Skipping.."
    }
}


## Moving data files

const files_to_create = [
{ 'name': 'background.json', 'value': '{"image": "", "brightness": 0.1, "saturation": 0.9}' },
{ 'name': 'favorite_paths', 'value': '' } ]

$files_to_create | each {|file|
    let path = $"($terminal_data_dir)/($file.name)"

    if not ($path | path exists) {
        $file.value | save $path
        print $"Created ($path)"
    } else {
        print $"File already exists: ($path). Skipping.."
    }
}

exit 0
