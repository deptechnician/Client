# ---------------------------------------------------------------
# Veracrypt reference
# ---------------------------------------------------------------

# Create a new volume:
#
veracrypt -t -c

# Mount a volume:
#
veracrypt volume.hc /media/veracrypt1

# Mount a volume as read-only, using keyfiles:
#
veracrypt -m ro -k keyfile1,keyfile2 volume.hc

# Mount a volume without mounting its filesystem:
#
veracrypt --filesystem=none volume.hc

# Mount a volume prompting only for its password:
#
veracrypt -t -k "" --pim=0 --protect-hidden=no volume.hc /media/veracrypt1

# Dismount a volume:
#
veracrypt -d volume.hc

# Dismount all mounted volumes:
#
veracrypt -d

# Veracrypt container creation
#
veracrypt -t -c ~/Documents/Encrypted.vc

# Veracrypt mounting
#
veracrypt ~/Documents/Encrypted.vc /media/veracrypt1

# Veracrypt soft linking
#
pushd ~/Documents
ln -s /media/veracrypt1 Encrypted
popd