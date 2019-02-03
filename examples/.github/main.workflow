workflow "Main" {
  on = "push"
  resolves = ["Roave BC Check"]
}

action "Roave BC Check" {
  uses = "docker://nyholm/roave-bc-check-ga"
  secrets = ["GITHUB_TOKEN"]
  args = ""
}
