
# ---------------------------------------------------------------
# User management reference
# ---------------------------------------------------------------

# Add a new user
sudo useradd -m USERNAME
sudo passwd USERNAME
sudo usermod -a -G sudo USERNAME

# Delete a user
sudo deluser --remove-home USERNAME
