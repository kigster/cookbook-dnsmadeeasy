# DnsMadeEasy

This cookbook does several things:

 1. it tries to determine what hostname the node should have
 2. it sets this hostname locally on the machine (using hostname-cookbook)
 3. it talks to DnsMadeEasy and attempts to register the new host, or delete it depending on the action.



