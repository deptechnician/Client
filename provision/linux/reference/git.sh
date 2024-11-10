# ---------------------------------------------------------------
# Git reference
# ---------------------------------------------------------------

# clone a repository
# 
git clone https://github.com/USERNAME/PROJECT

# update a repository
# 
git pull

# set email and user name
#
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"

# see where a repository came from
#
git remote get-url origin 

# see what changes are uncommitted
#
git status

# commit and push everything that has changed
#
git commit -a -m "Message for the commit"
git push

# add a specific file to the next commit
#
git add
