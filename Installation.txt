Installation steps:
1. Install the Fiji Distribution of ImageJ: https://imagej.net/Fiji/Downloads
2. Install Action Bar Plugin into ImageJ: http://imagejdocu.tudor.lu/doku.php?id=plugin:utilities:action_bar:start
3. Place Single_Cell_Phenytoping_and_Survival.ijm file in the '/macros/toolsets' directory of FIJI or ImageJ (Do not change file name: this will break the toolbar component.) 
4. Restart ImageJ.
5. Select '>>' on the right side of the ImageJ toolbar and then click on the macro name to install.
6. The macro and toolbar should then auto-run. If not, press [t] to call toolbar.
7. An instructions document will appear when the macro is installed.
8. A cross-shaped cell tracking tool (Survival Tool) will install in the ImageJ toolbar and is used in conjunction with the 'Cell State [a]' macro to set and track cell states.
9. Optional: Run the first part of the Setup macro to create a ring-shaped cursor for improved visibility of small objects during tracking. Creates a file called 'crosshair-cursor.gif' in the '/images' directory of FIJI or ImageJ. Requires ImageJ restart to take effect. Deleting the 'crosshair-cursor.gif' file will revert ImageJ back to the default cursor.
