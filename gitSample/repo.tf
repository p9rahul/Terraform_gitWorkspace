#Portal -> documentation - Resources -> search resources 
resource "github_repository" "terraform_git_repo1" {
  name        = "terraform_git_repo1"
  description = "create sample repo form terraform 1"
  visibility  = "public"

  # take Argument Reference from provider portal
  auto_init = true
}

# resource "github_repository" "terraform_git_repo1" {
#   name        = "terraform_git_repo1"
#   description = "create sample repo form terraform 2"
#   visibility = "public"

# # take Argument Reference from provider portal
#   auto_init =  true
# }

#git url 
output "url" {
  value = github_repository.terraform_git_repo1.html_url
}
