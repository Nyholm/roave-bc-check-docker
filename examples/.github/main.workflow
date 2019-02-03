workflow "Main" {
  on = "push"
  resolves = ["BC Check"]
}

action "PHPStan" {
  uses = "docker://nyholm/roave-bc-check-ga"
  secrets = ["GITHUB_TOKEN"]
  args = ""
}
