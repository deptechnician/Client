# ---------------------------------------------------------------
# Android emulator reference
# ---------------------------------------------------------------
~/Android/Sdk/emulator/emulator -list-avds

# Boot the device, save changes
#
~/Android/Sdk/emulator/emulator -avd OSINT

# Boot the devide from off state and save changes
# 
~/Android/Sdk/emulator/emulator -avd OSINT -no-snapshot-load

# Boot the device but don't save changes
#
~/Android/Sdk/emulator/emulator -avd OSINT -no-snapshot-save

# Reset the device to factory settings
#
~/Android/Sdk/emulator/emulator -avd OSINT -wipe-data

# Boot the device, save changes, force GPU accerlation from the host
#
~/Android/Sdk/emulator/emulator -avd OSINT -gpu host