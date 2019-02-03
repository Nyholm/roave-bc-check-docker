workflow "Main" {
  on = "push"
  resolves = ["BC Check"]
}

action "BC Check" {
  uses = "docker://nyholm/roave-bc-check-ga"
  secrets = ["GITHUB_TOKEN"]
  args = ""
}
