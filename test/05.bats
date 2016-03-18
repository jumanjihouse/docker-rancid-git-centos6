load vars

@test "rancid-git is installed" {
  run docker run --rm -t ${image} rpm -q rancid-git
  [ $status -eq 0 ]
}

@test "built rpms are available" {
  run docker run --rm ${image} find /tmp/tito -xdev -name '*.rpm'
  [[ $output =~ rancid-git-.*.x86_64.rpm ]]
  [[ $output =~ rancid-git-debuginfo-.*.x86_64.rpm ]]
  [[ $output =~ rancid-git-.*.src.rpm ]]
}
