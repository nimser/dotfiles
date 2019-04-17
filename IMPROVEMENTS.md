# ITEM 1 - Test driven configuration and checklist
- Have all the installation requirements matched by a todolist that automatically checks-up as validation tests are passed.
- Use something like spacemacs org-mode or something else to show the current status at any time.
- anytime a new configuration requirement appears, write the relevant new test, and the script necessary to make the test pass
- make the scripts run as part of the global install script, or directly from org-mode checklist
# ITEM 2 - Ansible provisioning
- Use ansible provisioning instead of the setup script
- Look for this example: https://github.com/pigmonkey/spark

