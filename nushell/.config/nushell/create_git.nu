def create-git [project: string] {
    let web = "https://github.com/darkxan771/" + $project + ".git"
    echo $web
    git init
    git add README.md
    git commit -m "Initial commit with README"
    git branch -M main
    git remote add origin $web
    git push -u origin main
    echo "-> Now launch lazygit to add files / folders"
}
