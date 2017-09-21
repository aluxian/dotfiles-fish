# http://lewandowski.io/2016/10/fish-env/
function posix_source
  for i in (cat $argv)
    set -l arr (echo $i | string match -r "([^=]+)=(.*)")
    set -g -x $arr[2] $arr[3]
  end
end
